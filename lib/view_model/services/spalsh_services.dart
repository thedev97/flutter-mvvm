import '../../model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../utils/routes/routes_name.dart';
import '../user_view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> get getUserData => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData.then((value) {
      if (value.token == 'null' || value.token == '') {
        Future.delayed(const Duration(seconds: 3), () async {
          await Navigator.pushNamed(context, RoutesName.login);
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () async {
          await Navigator.pushNamed(context, RoutesName.home);
        });
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
