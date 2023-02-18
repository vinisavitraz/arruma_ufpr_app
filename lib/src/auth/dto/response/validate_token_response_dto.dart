class ValidateTokenResponseDTO {

  final bool valid;
  final String? tokenExpirationDate;

  const ValidateTokenResponseDTO({
    required this.valid,
    this.tokenExpirationDate,
  });

  factory ValidateTokenResponseDTO.fromJson(dynamic json) {

    return ValidateTokenResponseDTO(
      valid: json['valid'],
      tokenExpirationDate: json['tokenExpirationDate'],
    );
  }

}