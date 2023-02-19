class StatusResponseDTO {

  final String status;

  const StatusResponseDTO({
    required this.status,
  });

  factory StatusResponseDTO.fromJson(dynamic json) {

    return StatusResponseDTO(
      status: json['status'],
    );
  }

}