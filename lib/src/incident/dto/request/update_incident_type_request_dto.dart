class UpdateIncidentTypeRequestDTO {

  int id;
  String name;
  String description;

  UpdateIncidentTypeRequestDTO({
    required this.id,
    required this.name,
    required this.description
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

}
