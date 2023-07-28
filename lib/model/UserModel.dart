class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? imageUrl;

  UserModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.confirmPassword,
      this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
