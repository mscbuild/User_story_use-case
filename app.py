from flask import Flask, jsonify, request
from functools import wraps

app = Flask(__name__)

# Пример базы данных пользователей и тарифов
users_db = {
    12345: {"name": "John Doe", "subscribed": True, "role": "premium"},
    67890: {"name": "Jane Smith", "subscribed": True, "role": "basic"},
}

tariffs_db = {
    "premium": {"tariffName": "Premium Plan", "cost": 999.99, "currency": "RUB", "validity": "1 month", "features": ["Unlimited calls", "10 GB internet", "Free SMS"]},
    "basic": {"tariffName": "Basic Plan", "cost": 499.99, "currency": "RUB", "validity": "1 month", "features": ["Unlimited calls", "3 GB internet"]},
}

# Проверка прав доступа
def check_access(func):
    @wraps(func)
    def decorated_function(*args, **kwargs):
        user_id = kwargs.get('user_id')
        if user_id not in users_db:
            return jsonify({"error": "User not found"}), 404
        user = users_db[user_id]
        if not user["subscribed"]:
            return jsonify({"error": "User not subscribed to any plan"}), 403
        return func(*args, **kwargs)
    return decorated_function

# Эндпоинт для получения тарифа
@app.route('/tariffs/<int:user_id>', methods=['GET'])
@check_access
def get_tariff(user_id):
    # Получаем роль пользователя и соответствующий тариф
    user = users_db[user_id]
    tariff = tariffs_db.get(user["role"])
    
    if tariff:
        return jsonify({
            "userId": user_id,
            "tariffName": tariff["tariffName"],
            "cost": tariff["cost"],
            "currency": tariff["currency"],
            "validity": tariff["validity"],
            "features": tariff["features"]
        })
    else:
        return jsonify({"error": "Tariff not found for user"}), 404

if __name__ == '__main__':
    app.run(debug=True)
