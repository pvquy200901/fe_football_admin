import 'dart:math';

import '../../api/api.dart';
import '../../controller/app_controller.dart';
import 'package:dio/dio.dart';

import '../../models/Stadium_model/Stadium.dart';
import '../../models/Team_model/team.dart';
//import 'package:fe_dacn_football/controller/app_controller.dart';

mixin StadiumApi on BaseApi {
  Future<List<listStadium>> getListStadium() async {
    const url = '/api/Admin/listStadium';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => listStadium.fromJson(e))
            .toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      saveLog(e);
      return [];
    }
  }

  Future<bool> createStadium(data) async {
    const url = '/api/Admin/createStadium';
    try {
      Response response = await dio.post(url,
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));

      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

  Future<bool> deleteStadium(name) async {
    const url = '/api/Admin/deleteStadium';
    try {
      Response response = await dio.delete(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ),
          queryParameters: {'stadium': name});

      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

  Future<bool> editStadium(name, data) async {
    const url = '/api/Admin/editStadium';
    try {
      Response response = await dio.post(url,
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ),
          queryParameters: {'name': name});
      if (response.statusCode == 200) {
        return true;
      }
      else{return false;}
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

  Future<String> setImageStadium(name,data) async {
    const url = '/api/Admin/addImageStadium';
    try {
      Response response = await dio.put(url,data: data,options: Options(
        headers: {'Content-Type': 'multipart/form-data', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'stadium': name}
      );
     if(response.statusCode == 200){
      print("ĐÃ CẬP NHẬT ẢNH");
       return response.data;
     }
     else{
      return "";
     }
    } catch (e) {
      saveLog(e);
      print(e);
      return "";
    }
  }
}
