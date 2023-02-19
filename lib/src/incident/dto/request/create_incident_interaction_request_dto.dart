class CreateIncidentInteractionRequestDTO {
  String description;
  int incidentId;
  int userId;
  int origin;

  CreateIncidentInteractionRequestDTO({
    required this.description,
    required this.incidentId,
    required this.userId,
    required this.origin
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['incidentId'] = this.incidentId;
    data['userId'] = this.userId;
    data['origin'] = this.origin;
    return data;
  }
}
