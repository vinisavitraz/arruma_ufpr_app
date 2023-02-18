class AuthUserRequestDTO {

  String? username;
  String? password;

  AuthUserRequestDTO({ this.username, this.password});


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

}