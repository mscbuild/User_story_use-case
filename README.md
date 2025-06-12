#🔐 Flask API with MySQL and JWT Authentication

This is a basic Flask application that demonstrates how to integrate **MySQL**, **Flask-SQLAlchemy** for database interaction, and **JWT (JSON Web Token)** for authentication. The application allows users to register, log in, and retrieve information about their subscription plans based on their roles.

 ## 🛠️ Installation

1. Clone the repository to your local machine:
 ~~~bash
   git clone https://github.com/mscbuild/User_story_use-case.git
 ~~~

2 Create a virtual environment (optional but recommended):
~~~bash
python -m venv venv
~~~

3.Activate the virtual environment:

- Windows:
~~~bash
venv\Scripts\activate
~~~
- MacOS/Linux:
~~~bash
  source venv/bin/activate
~~~
4.Install the required dependencies:
~~~bash
pip install -r requirements.txt
~~~
5.You will need a MySQL database for the application. Follow the steps below to set it up.

# ✅ Setup MySQL Database

- Install MySQL on your local machine if you haven't already. You can download it from here.

- Create a database named flask_db (or any name you prefer) and the following tables:

 3. Update the SQLALCHEMY_DATABASE_URI in app.py to reflect your MySQL credentials:
~~~bash
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://username:password@localhost/flask_db'
~~~
4. Run the application.

# 💼 Project Structure
~~~bash
flask-mysql-jwt/
│
├── app.py                    # Main application file
├── requirements.txt           # Python dependencies
├── README.md                  # Project documentation
└── venv/                      # Virtual environment (optional)
~~~

#🌐 API Endpoints

***Register***

***POST /register***

Registers a new user. The user will be added to the database with a hashed password.

***Request Body:***
~~~bash
{
    "username": "john_doe",
    "password": "password123",
    "role": "premium"
}
~~~
***Response:***
~~~bash
{
    "message": "User registered successfully"
}
~~~
***Login***

***POST /login***

Authenticates the user and generates a JWT access token.

***Request Body:***
~~~bash
{
    "username": "john_doe",
    "password": "password123"
}
~~~
***Response:***
~~~bash
{
    "access_token": "your_jwt_token"
}
~~~
***Get Tariff***

***GET /tariffs/{user_id}***

Returns the current subscription plan for the user, based on their role. This endpoint requires JWT authentication.

***Request Header:***
~~~bash
Authorization: Bearer your_jwt_token
~~~
***Response:***
~~~bash
{
    "userId": 1,
    "tariffName": "Premium Plan",
    "cost": 999.99,
    "currency": "RUB",
    "validity": "1 month",
    "features": [
        "Unlimited calls",
        "10 GB internet",
        "Free SMS"
    ]
}
~~~
# ✨ Running the Application

- Make sure MySQL is running and your database is set up as described above.

- Run the Flask application:
  ~~~bash
  python app.py
~~~
- The application will be running at http://127.0.0.1:5000/.

- Use an API testing tool like Postman or cURL to interact with the API.

# 🔀 Example: Register a User

***POST /register***
~~~bash
curl -X POST http://127.0.0.1:5000/register -H "Content-Type: application/json" -d '{"username": "john_doe", "password": "password123", "role": "premium"}'
~~~

# 👤 Example: Login

***POST /login***
~~~bash
curl -X POST http://127.0.0.1:5000/login -H "Content-Type: application/json" -d '{"username": "john_doe", "password": "password123"}'
~~~

# 👥 Example: Get Tariff

***GET /tariffs/1***
~~~bash
curl -X GET http://127.0.0.1:5000/tariffs/1 -H "Authorization: Bearer your_jwt_token"
~~~

# 📢 Contributing

We welcome contributions! If you have suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request.

- Fork the repository.

- Create a new branch (git checkout -b feature-name).

- Commit your changes (git commit -am 'Add new feature').

- Push to the branch (git push origin feature-name).

- Open a pull request.

# 📜 License

This project is licensed under the MIT License - see the LICENSE file for details. 
