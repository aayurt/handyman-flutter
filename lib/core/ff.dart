class UserModelRequest {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  String? email;
  String? password;
  int? overdraft;
  String? sortCode;
  String? telephone;
  String? gender;

  UserModelRequest(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.address,
      this.email,
      this.password,
      this.overdraft,
      this.sortCode,
      this.telephone,
      this.gender});

  UserModelRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    overdraft = json['overdraft'];
    sortCode = json['sortCode'];
    telephone = json['telephone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['overdraft'] = overdraft;
    data['sortCode'] = sortCode;
    data['telephone'] = telephone;
    data['gender'] = gender;
    return data;
  }
}
