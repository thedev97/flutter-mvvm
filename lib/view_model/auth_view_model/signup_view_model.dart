import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../repository/auth_repository.dart';

class SignupViewModel with ChangeNotifier{
  final  _myRepo = AuthRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool val){
    _isLoading = val;
    notifyListeners();
  }

  Future<void> signupApi(dynamic data , BuildContext context)async{
    setLoading(true);
    _myRepo.signupApi(data).then((value){
      setLoading(false);
      Utils.flushBar('Registration Successfully', context);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, RoutesName.home);
      });
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}