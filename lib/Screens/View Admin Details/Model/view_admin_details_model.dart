// To parse required this JSON data, do
//
//     final viewSubAdminModel = viewSubAdminModelFromJson(jsonString);

class SubAdmin {
  final int? id;
  final int? superadminid;
  final int? societyid;
  final int? subadminid;

  final String? firstname;
  final String? lastname;
  final String? cnic;
  final String? address;
  final String? mobileno;
  final String? password;
  final int? roleid;
  final String? rolename;
  final String? image;

  SubAdmin(
      {required this.id,
      required this.firstname,
      required this.superadminid,
      required this.societyid,
      required this.subadminid,
      required this.lastname,
      required this.cnic,
      required this.address,
      required this.mobileno,
      required this.password,
      required this.roleid,
      required this.rolename,
      required this.image});

  //
  // SubAdmin({
  //     required required this.id,
  //     required required this.superadminid,
  //     required required this.societyid,
  //     required required this.subadminid,
  //
  //     required required this.firstname,
  //     required required this.lastname,
  //     required required this.cnic,
  //     required required this.address,
  //     required required this.mobileno,
  //     required required this.password,
  //     required required this.roleid,
  //     required required this.rolename,
  //     required required this.image,
  // });

}
