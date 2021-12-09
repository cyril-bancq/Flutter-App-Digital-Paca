class User {
  var userId;
  var email;
  var password;
  var token;
  var renewalToken;

  User({this.userId, this.email, this.password, this.token, this.renewalToken});

  factory User.fromJson(Map<String,dynamic> responseData) {
    return User(
      userId: responseData['id'],
      email: responseData['email'],
      password: responseData['password'],
      token: responseData['token'],
      renewalToken: responseData['token'],
    );
  }
}