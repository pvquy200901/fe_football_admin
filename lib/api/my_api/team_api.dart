 import '../../api/api.dart';
import '../../controller/app_controller.dart';
import 'package:dio/dio.dart';

import '../../models/Team_model/team.dart';
import '../../models/User_model/User.dart';
 
 mixin TeamApi on BaseApi{
  
 Future<List<listTeam>> getListTeam() async{
    const url = '/api/User/listTeam';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ));
      if (response.statusCode == 200) {
       
        return (response.data as List).map((e) => listTeam.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
     
      saveLog(e);
      return [];
    }
  }

  Future<listTeam> getInfoTeamForAdmin(team) async{
    const url = '/api/Admin/getInfoTeam';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*','token':appController.token},
      ),
      queryParameters: {'team': team}
      );
      if (response.statusCode == 200) {
        print("------------------------------${response.data.toString()}");
        return listTeam.fromJson(response.data);
       
      } else {
        appController.errorLog = response.data['mess'];
        return listTeam();
      }
    } catch (e) {
      
      saveLog(e);
      return listTeam();
    }
  }

  Future<List<infoUser>> getListUserInTeam(team) async{
    const url = '/api/User/getListUserInTeam';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ),
      queryParameters: {'team': team}
      );
      if (response.statusCode == 200) {
        
        return (response.data as List).map((e) => infoUser.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      
      saveLog(e);
      return [];
    }
  }

   Future<bool> removeTeam(team) async {
    const url = '/api/Admin/revomeTeam';
    try {
      Response response = await dio.delete(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'team': team},
      );
     
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }
 }