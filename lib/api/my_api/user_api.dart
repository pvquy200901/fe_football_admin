 import '../../api/api.dart';
import '../../controller/app_controller.dart';
import 'package:dio/dio.dart';
import '../../models/User_model/User.dart';
 
 mixin UserApi on BaseApi{
  
 Future<List<listUser>> getListUser() async{
    const url = '/api/Admin/listUser';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token': appController.token},
      ));
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => listUser.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      saveLog(e);
      return [];
    }
  }
 Future<UserModel> getInfoUser(String username) async{
   const url = '/api/admin/getInfoUserForAdmin';
   try {
     Response response = await dio.get(url, options: Options(
       headers: {'Content-Type': 'application/json', 'accept': '*/*','token':appController.token},
     ),queryParameters: {'username': username});
     if (response.statusCode == 200) {
       return UserModel.fromJson(response.data);

     } else {
       appController.errorLog = response.data['mess'];
       return UserModel();
     }
   } catch (e) {

     saveLog(e);
     return UserModel();
   }
 }
  Future<bool> deleteUser(username) async {
    const url = '/api/Admin/revomeUser';
    try {
      Response response = await dio.delete(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ),
          queryParameters: {'username': username});

      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }
 }