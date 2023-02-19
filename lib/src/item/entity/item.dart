class Item {
  int? id;
  String? name;
  String? description;
  int? locationId;
  String? locationName;

  Item(
      {this.id,
        this.name,
        this.description,
        this.locationId,
        this.locationName});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    locationId = json['locationId'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    return data;
  }
}
