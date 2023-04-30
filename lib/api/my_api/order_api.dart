import 'dart:math';

import '../../api/api.dart';
import '../../controller/app_controller.dart';
import 'package:dio/dio.dart';

import '../../models/Order_model/listOrder.dart';
import '../../models/Stadium_model/Stadium.dart';
import '../../models/Team_model/team.dart';
//import 'package:fe_dacn_football/controller/app_controller.dart';

mixin OrderApi on BaseApi {
  Future<List<listOrder>> getListOrderToday() async {
    const url = '/api/Order/listOrderToday';
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
            .map((e) => listOrder.fromJson(e))
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

  Future<List<listOrder>> getListConfirmOrder() async {
    const url = '/api/Admin/listConfirmOrder';
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
            .map((e) => listOrder.fromJson(e))
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

  Future<double> totalPriceToday() async {
    const url = '/api/Admin/getTotalPriceInDay';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));

      return response.data;
    } catch (e) {
      saveLog(e);
      return 0;
    }
  }

  Future<int> totalOrderInMonth() async {
    const url = '/api/Admin/getTotalOrderInMonth';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));

      return response.data;
    } catch (e) {
      saveLog(e);
      return 0;
    }
  }
  Future<double> totalPriceYear() async {
    const url = '/api/Admin/getTotalPriceInYear';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));

      return response.data;
    } catch (e) {
      saveLog(e);
      return 0;
    }
  }
  Future<double> totalPriceMonth() async {
    const url = '/api/Admin/getTotalPriceInMonth';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
              'token': appController.token
            },
          ));

      return response.data;
    } catch (e) {
      saveLog(e);
      return 0;
    }
  }
Future<List<listOrder>> getListOrderAllTime(date) async{
    const url = '/api/Admin/listAllOrderForAdmin';
    try {
      Response response = await dio.get(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*','token':appController.token},
      ),
      queryParameters: {'time': date}
      );
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => listOrder.fromJson(e)).toList();
       
      } else {
        appController.errorLog = response.data['mess'];
        return [];
      }
    } catch (e) {
      
      saveLog(e);
      return [];
    }
  }

  Future<bool> createOrder(data) async {
    const url = '/api/Order/createOrderForAdmin';
    try {
      Response response = await dio.post(url, data: data, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ));
     
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }

   Future<bool> confirmOrder(code) async {
    const url = '/api/Admin/confirmOrderStadium';
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

   Future<bool> cancelOrder(code) async {
    const url = '/api/Admin/cancelOrderStadium';
    try {
      Response response = await dio.put(url, options: Options(
        headers: {'Content-Type': 'application/json', 'accept': '*/*', 'token' : appController.token},
      ),
      queryParameters: {'code': code},
      );
      print("Đã từ chối");
      return true;
    } catch (e) {
      saveLog(e);
      return false;
    }
  }
}
