class UpdateItemRequestDTO {

  int id;
  String name;
  String description;
  int locationId;

  UpdateItemRequestDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.locationId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['locationId'] = this.locationId;
    return data;
  }

}
