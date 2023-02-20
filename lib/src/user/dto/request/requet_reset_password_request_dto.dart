class RequestResetPasswordRequestDTO {

  String email;

  RequestResetPasswordRequestDTO({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}
