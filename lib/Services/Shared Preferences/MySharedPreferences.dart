
import '../../Constants/shared_preferences_constants.dart';
import '../../Screens/Login/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
 deleteUserData() async {
  User _user = User();

  await SharedPreferences.getInstance().then((value) {
    // value.remove(userIdSPKey);
    // value.remove(firstNameSPKey);
    // value.remove(lastNameSPKey);
    final success=    value.remove(bearerTokenSPKey);
    print(success.then((value) => value));
    // value.remove(cnicSPKey);
    // value.remove(roleNameSPKey);
    // value.remove(roleIdSPKey);

  });
}
class MySharedPreferences {

  static deleteUserData() async {
    User _user = User();

    await SharedPreferences.getInstance().then((value) {
      // value.remove(userIdSPKey);
      // value.remove(firstNameSPKey);
      // value.remove(lastNameSPKey);
      final success=    value.remove(bearerTokenSPKey);

      print(success.then((value) => value));
      value.remove(cnicSPKey);
      value.remove(roleNameSPKey);
      value.remove(roleIdSPKey);

    });
  }


  static setUserData({required User user}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(userIdSPKey, user.id ?? 0);
      value.setString(firstNameSPKey, user.firstName ?? '');
      value.setString(lastNameSPKey, user.lastName ?? '');
      value.setString(bearerTokenSPKey, user.bearerToken ?? '');
      value.setString(cnicSPKey, user.cnic ?? '');
      value.setString(roleNameSPKey, user.roleName ?? '');
      value.setString(passwordSPKey, user.password ?? '');
      value.setInt(roleIdSPKey, user.roleId ?? 0);
    });
  }

  static Future<User> getUserData() async {
    User _user = User();
    await SharedPreferences.getInstance().then((value) {
      value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
      value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
      value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');
      value.getString(bearerTokenSPKey) ??
          value.setString(bearerTokenSPKey, '');
      value.getString(cnicSPKey) ?? value.setString(cnicSPKey, '');
      value.getString(passwordSPKey) ?? value.setString(passwordSPKey, '');

      value.getString(roleNameSPKey) ?? value.setString(roleNameSPKey, '');

      value.getInt(roleIdSPKey) ?? value.setInt(roleIdSPKey, 0);

      _user = User(
          id: value.getInt(userIdSPKey),
          firstName: value.getString(firstNameSPKey),
          lastName: value.getString(lastNameSPKey),
          bearerToken: value.getString(bearerTokenSPKey),
          cnic: value.getString(cnicSPKey),
          roleId: value.getInt(roleIdSPKey),
          password: value.getString(passwordSPKey),
          roleName: value.getString(roleNameSPKey));
    });

    return _user;
  }



}
