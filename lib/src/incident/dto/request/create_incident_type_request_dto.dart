class CreateIncidentTypeRequestDTO {

  String name;
  String description;

  CreateIncidentTypeRequestDTO({
    required this.name,
    required this.description
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

}
