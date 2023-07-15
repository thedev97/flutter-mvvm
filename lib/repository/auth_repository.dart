import 'package:flutter_mvvm/res/remote_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response =
          _apiServices.postApiResponse(RemoteUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async{
    try{
      final response = _apiServices.postApiResponse(RemoteUrl.signupEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}
