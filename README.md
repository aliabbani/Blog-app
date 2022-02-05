![](https://img.shields.io/badge/Microverse-blueviolet)
# Blog-app
The Blog app will be a classic example of a blog website. I will create a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With
Ruby 
Ruby on Rails

## Getting Started
To get a local copy up and running follow these simple example steps.

### Prerequisites
Ruby: 2.6.3 Rails: 5.2.3 Postgres: >=9.5

### Setup
Install gems with:
```javascript
bundle install
```
Setup database with:
```javascript
rails db:create
rails db:migrate
rails db:seed
```
### Usage
Start server with:
```javascript
rails server
```
Open http://localhost:3000/ in your browser.

### Run tests
Install npm with:
```javascript
npm i
```
Install rspec with:
```javascript
bundle install
```
and
```javascript
rails generate rspec:install
```

### run the test with:
```javascript
rspec spec
```
### API
All API endpoints receives JSON and responds in a JSON format as well.

Has API endpoint that returns all comments for a post - GET : /users/:user_id/posts/:id/comments
`curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjQ0MDc5NzQzLCJleHAiOjE2NDQwODMzNDMsImp0aSI6ImRlNjFjMzUzLTY4NDAtNDczZC04YjIzLTZmYWJiNTBhOTdhOCJ9.1gpx3E_QnXpDL8_Mx_JDHimAfaXI1-Gti0aOMrZWoQ0" -H "Content-Type: application/json" http://localhost:3000/posts/1/comments
`
Has API endpoint that returns all comments for a post - GET : /users/:user_id/posts/:id/comments:
before to get the token you need to login

`
curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjQ0MDc5NzQzLCJleHAiOjE2NDQwODMzNDMsImp0aSI6ImRlNjFjMzUzLTY4NDAtNDczZC04YjIzLTZmYWJiNTBhOTdhOCJ9.1gpx3E_QnXpDL8_Mx_JDHimAfaXI1-Gti0aOMrZWoQ0" -H "Content-Type: application/json" http://localhost:3000/users/1/posts/1/comments

`

Has API endpoint that adds' a comment to a post - POST : /users/:user_id/posts/:id/comments

Has API endpoint for authentication, both registration and login

Login endpoint - GET : /sign_in email=xxxxxx password=hhhhhuhuhhugvrrr

` http http://127.0.0.1:3000/users/sign_in email=talmud@gmail.com password=123456789
`

Registration endpoint - POST : /users name="xxx" password="your password" email="your email"

I.E: with the httpie program:


`
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users/sign_in 
`

or

`
 http POST http://127.0.0.1:3000/users name=tatata email=tatata@gmail.com password=123456789 password_confirmation=123456789
`

## Author

👤 **Ali Abbani**

## Ali's Profile

- [GitHub](https://github.com/aliabbani)
- [AngelList](https://angel.co/u/ali-abbani)
- [LinkedIn](https://www.linkedin.com/in/ali-abbani-8b6246150/)
  👤 **Ali Abbani**

## Ali's Profile

- [GitHub](https://github.com/aliabbani)
- [AngelList](https://angel.co/u/ali-abbani)
- [LinkedIn](https://www.linkedin.com/in/ali-abbani-8b6246150/)
## 🤝 Contributing
Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/aliabbani/Blog-app/issues).

## Show your support
Give a ⭐️ if you like this project!

## Acknowledgments
A special thanks to Microverse for inspiring this project.
A special thanks goes to all our peers at Microverse for being there for me.
## 📝 License
This project is MIT licensed.