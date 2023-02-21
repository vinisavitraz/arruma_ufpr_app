class CreateItemRequestDTO {

  String name;
  String description;
  int locationId;

  CreateItemRequestDTO({
    required this.name,
    required this.description,
    required this.locationId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['locationId'] = this.locationId;
    return data;
  }

}
