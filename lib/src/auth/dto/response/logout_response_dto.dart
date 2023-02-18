class LogoutResponseDTO {

  final String message;

  const LogoutResponseDTO({
    required this.message
  });

  factory LogoutResponseDTO.fromJson(dynamic json) {
    return LogoutResponseDTO(message: json['message']);
  }

}