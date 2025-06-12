# Flask API with MySQL and JWT Authentication

This is a basic Flask application that demonstrates how to integrate **MySQL**, **Flask-SQLAlchemy** for database interaction, and **JWT (JSON Web Token)** for authentication. The application allows users to register, log in, and retrieve information about their subscription plans based on their roles.

## Table of Contents
- [Installation](#installation)
- [Setup MySQL Database](#setup-mysql-database)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
  - [Register](#register)
  - [Login](#login)
  - [Get Tariff](#get-tariff)
- [Running the Application](#running-the-application)
- [Contributing](#contributing)

## Installation

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

# Setup MySQL Database

_ Install MySQL on your local machine if you haven't already. You can download it from here.

_ Create a database named flask_db (or any name you prefer) and the following tables:

 
