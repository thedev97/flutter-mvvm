import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBar('Login Successfully', context);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, RoutesName.home);
      });
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
