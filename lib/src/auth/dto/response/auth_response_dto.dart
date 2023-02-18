class AuthResponseDTO {

  final int userId;
  final String token;
  final String tokenExpirationDate;

  AuthResponseDTO({
    required this.userId,
    required this.token,
    required this.tokenExpirationDate,
  });

  factory AuthResponseDTO.fromJson(dynamic json) {
    return AuthResponseDTO(
      userId: json['userId'],
      token: json['token'],
      tokenExpirationDate: json['tokenExpirationDate'],
    );
  }

}