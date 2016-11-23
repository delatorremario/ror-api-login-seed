# README

This it's seed for Ruby On Rails API with basic Login functions.

* Registristations

* Login

* User Profile

* Send Reset Password Email


Use:

* Ruby 2.3.0p0

* Rails 5.0.0.1

* Devise and DoorKeeper for Authentications functions.

* Capistrano for Deploy.

* PostgreSQL DB.

* Mailtrap for mails test.

Instruccions:

* Install PostgreSQL

* git clone https://github.com/delatorremario/ror-api-login-seed

* rake db:migrate

* rake db:setup 

* rails s


Exmaples:
Login
curl --request POST \
  --url {{URL}}//users/password \
  --header 'content-type: application/json' \
  --data '{\n    "email" : "juan@perez.com"\n}'

Register
curl --request POST \
  --url {{URL}}/users \
  --header 'content-type: application/json' \
  --data '{\n	"email":"juan@perez.com",\n	"password":"Mar45678",\n	"first_name": "Demo3",\n    "last_name": "Apellido",\n    "gender": "M",\n    "phone": "23492304"\n}'

Get User Profile
curl --request GET \
  --url {{URL}}/profile \
  --header 'authorization: Bearer token'

Update Profile
curl --request PUT \
  --url {{URL}}/profile/1 \
  --header 'authorization: Bearer {{senador_token}}' \
  --header 'content-type: application/json' \
  --data '{\n    "first_name" : "Andres",\n    "last_name": "Lobo",\n     "gender":"male",\n   "phone":"0800pegaleauna"\n}' 

Send Mail for Reset Password
curl --request POST \
  --url {{URL}}//users/password \
  --header 'content-type: application/json' \
  --data '{\n    "email" : "juan@perez.com"\n}'

Change Password
curl --request PUT \
  --url {{URL}}/users/password \
  --header 'content-type: application/json' \
  --data '{\n  "password": "11111111",\n  "password_confirmation":"11111111",\n  "password_token": "123456"\n}' 
  * see password_token in email sended