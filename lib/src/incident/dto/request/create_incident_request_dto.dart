class CreateIncidentRequestDTO {

  String title;
  String description;
  int userId;
  int incidentTypeId;
  String incidentTypeName;
  String incidentTypeDescription;
  int locationId;
  String locationName;
  String locationDescription;
  int itemId;
  String itemName;
  String itemDescription;

  CreateIncidentRequestDTO({
    required this.title,
    required this.description,
    required this.userId,
    required this.incidentTypeId,
    required this.incidentTypeName,
    required this.incidentTypeDescription,
    required this.locationId,
    required this.locationName,
    required this.locationDescription,
    required this.itemId,
    required this.itemName,
    required this.itemDescription
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['incidentTypeId'] = this.incidentTypeId;
    data['incidentTypeName'] = this.incidentTypeName;
    data['incidentTypeDescription'] = this.incidentTypeDescription;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['locationDescription'] = this.locationDescription;
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['itemDescription'] = this.itemDescription;
    return data;
  }
}
