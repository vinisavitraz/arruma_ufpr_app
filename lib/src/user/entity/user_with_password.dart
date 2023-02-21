class UserWithPassword {

  int? id;
  String? name;
  String? phone;
  String? document;
  String? address;
  String? email;
  int? role;
  String? password;
  String? confirmPassword;

  UserWithPassword(
      {this.id,
        this.name,
        this.phone,
        this.document,
        this.address,
        this.email,
        this.role,
        this.password,
        this.confirmPassword,
      });

  UserWithPassword.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    document = json['document'];
    address = json['address'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['document'] = this.document;
    data['address'] = this.address;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
