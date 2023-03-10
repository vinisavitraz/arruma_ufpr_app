class Incident {
  int? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? status;
  int? incidentTypeId;
  String? incidentTypeName;
  int? locationId;
  String? locationName;
  int? itemId;
  String? itemName;
  int? userId;
  String? userName;
  int? adminId;
  String? adminName;
  int? fileMetadataId;
  int? totalInteractions;
  int? priority;
  int? rating;
  int? totalUnreadInteractions;


  Incident(
      {this.id,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.status,
        this.incidentTypeId,
        this.incidentTypeName,
        this.locationId,
        this.locationName,
        this.itemId,
        this.itemName,
        this.userId,
        this.userName,
        this.adminId,
        this.adminName,
        this.fileMetadataId,
        this.totalInteractions,
        this.priority,
        this.rating,
        this.totalUnreadInteractions,
      });

  Incident.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    incidentTypeId = json['incidentTypeId'];
    incidentTypeName = json['incidentTypeName'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    userId = json['userId'];
    userName = json['userName'];
    adminId = json['adminId'];
    adminName = json['adminName'];
    fileMetadataId = json['fileMetadataId'];
    totalInteractions = json['totalInteractions'];
    priority = json['priority'];
    rating = json['rating'];
    totalUnreadInteractions = json['totalUnreadInteractions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    data['incidentTypeId'] = this.incidentTypeId;
    data['incidentTypeName'] = this.incidentTypeName;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['adminId'] = this.adminId;
    data['fileMetadataId'] = this.fileMetadataId;
    data['adminName'] = this.adminName;
    data['totalInteractions'] = this.totalInteractions;
    data['priority'] = this.priority;
    data['rating'] = this.rating;
    data['totalUnreadInteractions'] = this.totalUnreadInteractions;
    return data;
  }
}