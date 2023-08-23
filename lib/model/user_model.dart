class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? dateOfBirth;
  String? phone;
  String? gender;
  String? imageUrl;
  String? fcmToken;

  UserModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.gender,
      this.dateOfBirth,
      this.imageUrl,
      this.fcmToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    phone = json['phone'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['imageUrl'] = this.imageUrl;
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}
