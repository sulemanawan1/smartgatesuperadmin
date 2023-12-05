class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? cnic;
  final String? address;
  final String? mobileno;
  final int? roleId;
  final String? roleName;
  final String? password;
  final String? bearerToken;
  final String? image;

  User(
      {this.mobileno,
      this.address,
      this.id,
      this.firstName,
      this.lastName,
      this.cnic,
      this.roleId,
      this.roleName,
      this.password,
      this.image,
      this.bearerToken});
}
