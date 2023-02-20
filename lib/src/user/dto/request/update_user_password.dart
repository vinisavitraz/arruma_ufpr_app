class UpdateUserPasswordRequestDTO {
  int userId;
  String password;
  String confirmPassword;

  UpdateUserPasswordRequestDTO({
    required this.userId,
    required this.password,
    required this.confirmPassword
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
