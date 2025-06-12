from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager, jwt_required, create_access_token
from werkzeug.security import generate_password_hash, check_password_hash

# Инициализация Flask-приложения
app = Flask(__name__)

# Настройки для подключения к MySQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://username:password@localhost/dbname'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['JWT_SECRET_KEY'] = 'your_jwt_secret_key'  # Секретный ключ для JWT

# Инициализация базы данных и JWT
db = SQLAlchemy(app)
jwt = JWTManager(app)

# Модели для базы данных

# Модель пользователя
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    role = db.Column(db.String(50), nullable=False)
    subscribed = db.Column(db.Boolean, nullable=False, default=False)

# Модель тарифа
class Tariff(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    cost = db.Column(db.Float, nullable=False)
    currency = db.Column(db.String(10), nullable=False)
    validity = db.Column(db.String(50), nullable=False)
    features = db.Column(db.Text, nullable=True)

# Эндпоинт для аутентификации пользователя и получения токена
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    user = User.query.filter_by(username=username).first()
    if user and check_password_hash(user.password, password):
        access_token = create_access_token(identity=user.id)
        return jsonify({"access_token": access_token}), 200
    return jsonify({"error": "Invalid credentials"}), 401

# Эндпоинт для получения тарифа пользователя
@app.route('/tariffs/<int:user_id>', methods=['GET'])
@jwt_required()  # Требуется авторизация
def get_tariff(user_id):
    # Получаем данные о пользователе
    user = User.query.get(user_id)
    if not user:
        return jsonify({"error": "User not found"}), 404

    # Проверка подписки
    if not user.subscribed:
        return jsonify({"error": "User not subscribed to any plan"}), 403

    # Получаем тариф пользователя
    tariff = Tariff.query.filter_by(name=user.role).first()
    if not tariff:
        return jsonify({"error": "No tariff found for this user role"}), 404

    return jsonify({
        "userId": user.id,
        "tariffName": tariff.name,
        "cost": tariff.cost,
        "currency": tariff.currency,
        "validity": tariff.validity,
        "features": tariff.features.split(",") if tariff.features else []
    })

# Эндпоинт для регистрации нового пользователя
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')
    role = data.get('role')

    if User.query.filter_by(username=username).first():
        return jsonify({"error": "User already exists"}), 400

    hashed_password = generate_password_hash(password)

    new_user = User(username=username, password=hashed_password, role=role, subscribed=False)
    db.session.add(new_user)
    db.session.commit()

    return jsonify({"message": "User registered successfully"}), 201

if __name__ == '__main__':
    db.create_all()  # Создаем таблицы в базе данных (если они ещё не существуют)
    app.run(debug=True)
