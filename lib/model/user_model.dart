class UserModel {
  final String userID;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String createdDate;

  UserModel({
    this.userID,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.createdDate,
  });

  factory UserModel.fromJson(Map <String, dynamic> data) {
    return UserModel(
      userID: data['userID'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      address: data['address'],
      createdDate: data['createdDate'],
    );
  }
}
