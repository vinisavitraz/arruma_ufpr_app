class AuthResponseDTO {

  final int userId;
  final String status;
  final String code;
  final String token;
  final String tokenExpirationDate;

  AuthResponseDTO({
    required this.userId,
    required this.status,
    required this.code,
    required this.token,
    required this.tokenExpirationDate,
  });

  factory AuthResponseDTO.fromJson(dynamic json) {
    return AuthResponseDTO(
      status: json['status'],
      code: json['code'],
      userId: json['user_id'],
      token: json['token'],
      tokenExpirationDate: json['token_expiration_date'],
    );
  }

}