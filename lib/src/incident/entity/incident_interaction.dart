class IncidentInteraction {
  int? id;
  String? description;
  String? sentDate;
  int? origin;
  int? userId;
  String? userName;
  int? incidentId;

  IncidentInteraction(
      {this.id,
        this.description,
        this.sentDate,
        this.origin,
        this.userId,
        this.userName,
        this.incidentId});

  IncidentInteraction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    sentDate = json['sentDate'];
    origin = json['origin'];
    userId = json['userId'];
    userName = json['userName'];
    incidentId = json['incidentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['sentDate'] = this.sentDate;
    data['origin'] = this.origin;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['incidentId'] = this.incidentId;
    return data;
  }
}
