import 'dart:math';

import '../../api/api.dart';
import '../../controller/app_controller.dart';
import 'package:dio/dio.dart';
import '../../models/News_model/news.dart';
//import 'package:fe_dacn_football/controller/app_controller.dart';

mixin NewsApi on BaseApi{
  Future<List<News>> getListNews() async{
    const url = '/api/News/listOKNewsForAdmin';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ));
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => News.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      print("Loi ${e.toString()}");
      saveLog(e);
      return [];
    }
  }

   Future<List<News>> getListConfirmNews() async{
    const url = '/api/News/list_ConfirmNews';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*','token':  appController.token},
      ));
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => News.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      print("Loi ${e.toString()}");
      saveLog(e);
      return [];
    }
  }



  Future<infoNews> getInfoNewsForAdmin(code) async{
    const url = '/api/News/getInfo_ConfirmNews';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*','token':appController.token},
      ),
      queryParameters: {'news': code}
      );
      if (response.statusCode == 200) {
        print("------------------------------${response.data.toString()}");
        return infoNews.fromJson(response.data);
       
      } else {
        appController.errorLog = response.data['mess'];
        return infoNews();
      }
    } catch (e) {
      
      saveLog(e);
      return infoNews();
    }
  }

   Future<bool> removeNews(code) async {
    const url = '/api/Admin/revomeNews';
    try {
      Response response = await dio.delete(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'code': code},
      );
     
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

   Future<bool> denyNews(code) async {
    const url = '/api/Admin/denyNews';
    try {
      Response response = await dio.put(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'code': code},
      );
     
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

   Future<bool> confirmNews(code) async {
    const url = '/api/News/confirmNews';
    try {
      Response response = await dio.put(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'code': code},
      );
     
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

  Future<List<NewsV2>> getListDenyNews() async{
    const url = '/api/News/listDenyNews';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ));
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => NewsV2.fromJson(e)).toList();
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      print("Loi ${e.toString()}");
      saveLog(e);
      return [];
    }
  }


 Future<String> sendEmail(email) async {
    const url = '/api/Admin/sendEmail';
    try {
      Response response = await dio.put(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*'},
      ),
      queryParameters: {'email': email},
      );
      print("ĐÃ GỬI");
      return "ĐÃ GỬI";
    } catch (e) {
      saveLog(e);
      print("Lỗi" + e.toString());
      return e.toString();
    }
  }
  
  
}