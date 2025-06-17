# 🔐 Flask API with MySQL and JWT Authentication
  ![](https://komarev.com/ghpvc/?username=mscbuild) 
 ![](https://img.shields.io/github/license/mscbuild/e-learning) 
  ![](https://img.shields.io/github/repo-size/mscbuild/User_story_use-case)
![](https://img.shields.io/badge/PRs-Welcome-green)
![](https://img.shields.io/badge/code%20style-sql/python-green)
![](https://img.shields.io/github/stars/mscbuild)
![](https://img.shields.io/badge/Topic-Github-lighred)
![](https://img.shields.io/website?url=https%3A%2F%2Fgithub.com%2Fmscbuild)

This is a basic Flask application that demonstrates how to integrate **MySQL**, **Flask-SQLAlchemy** for database interaction, and **JWT (JSON Web Token)** for authentication. The application allows users to register, log in, and retrieve information about their subscription plans based on their roles.

 ## 🛠️ Installation

1. Clone the repository to your local machine:
 ~~~ruby
   git clone https://github.com/mscbuild/User_story_use-case.git
 ~~~

2 Create a virtual environment (optional but recommended):
~~~ruby
python -m venv venv
~~~

3.Activate the virtual environment:

- Windows:
~~~ruby
venv\Scripts\activate
~~~
- MacOS/Linux:
~~~ruby
  source venv/bin/activate
~~~
4.Install the required dependencies:
~~~ruby
pip install -r requirements.txt
~~~
5.You will need a MySQL database for the application. Follow the steps below to set it up.

# ✅ Setup MySQL Database

- Install MySQL on your local machine if you haven't already. You can download it from here.

- Create a database named flask_db (or any name you prefer) and the following tables:

 3. Update the SQLALCHEMY_DATABASE_URI in app.py to reflect your MySQL credentials:
~~~ruby
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://username:password@localhost/flask_db'
~~~
4. Run the application.

# 💼 Project Structure
~~~ruby
flask-mysql-jwt/
│
├── app.py                    # Main application file
├── requirements.txt           # Python dependencies
├── README.md                  # Project documentation
└── venv/                      # Virtual environment (optional)
~~~

# 🌐 API Endpoints

***Register***

***POST /register***

Registers a new user. The user will be added to the database with a hashed password.

***Request Body:***
~~~ruby
{
    "username": "john_doe",
    "password": "password123",
    "role": "premium"
}
~~~
***Response:***
~~~ruby
{
    "message": "User registered successfully"
}
~~~
***Login***

***POST /login***

Authenticates the user and generates a JWT access token.

***Request Body:***
~~~ruby
{
    "username": "john_doe",
    "password": "password123"
}
~~~
***Response:***
~~~ruby
{
    "access_token": "your_jwt_token"
}
~~~
***Get Tariff***

***GET /tariffs/{user_id}***

Returns the current subscription plan for the user, based on their role. This endpoint requires JWT authentication.

***Request Header:***
~~~ruby
Authorization: Bearer your_jwt_token
~~~
***Response:***
~~~ruby
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
  ~~~ruby
  python app.py
~~~
- The application will be running at http://127.0.0.1:5000/.

- Use an API testing tool like Postman or cURL to interact with the API.

# 🔀 Example: Register a User

***POST /register***

~~~ruby
curl -X POST http://127.0.0.1:5000/register -H "Content-Type: application/json" -d '{"username": "john_doe", "password": "password123", "role": "premium"}'
~~~

# 👤 Example: Login

***POST /login***
~~~ruby
curl -X POST http://127.0.0.1:5000/login -H "Content-Type: application/json" -d '{"username": "john_doe", "password": "password123"}'
~~~

# 👥 Example: Get Tariff

***GET /tariffs/1***
~~~ruby
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
