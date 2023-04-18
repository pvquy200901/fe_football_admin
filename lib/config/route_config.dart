import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



import '../controller/app_controller.dart';
import '../screens/Login.dart';
import '../screens/customer/Customer.dart';
import '../screens/dashboard/Dashboard.dart';
import '../screens/news/News.dart';
import '../screens/news/News_Accept.dart';
import '../screens/stadium/Stadium.dart';
import '../screens/team/Team.dart';
import '../widget/selling/create_order/item_stadium.dart';
import '../widget/selling/create_order/landing_stadium.dart';
import '../widget/selling/create_order/listWaitConfirm.dart';


class RouteConfig {
  static final List<RouteToPage> _routeToPage = [
  
    RouteToPage(name: '/login', page: const Login(), roles: []),
 
  ];
  final List<GetPage> _route = _routeToPage
      .map((route) => GetPage(name: route.name, page: () => route.page))
      .toList();

  final List<RouteModel> _navbar = [
   
  ];
  List<GetPage> get getRoute => [
       
        //GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/dashboardView', page: () => DashboardView()),
       GetPage(name: '/listStadium', page: () => StadiumView()),
       GetPage(name: '/order', page: () => LandingStadium()),
       GetPage(name: '/listUser', page: () => CustomerView()),
       GetPage(name: '/listNews', page: () => NewsView()),
       GetPage(name: '/listConfirmNews', page: () => NewsAcceptView()),
       GetPage(name: '/listTeam', page: () => TeamView()),
       GetPage(name: '/listConfirmOrder', page: () => ListWaitConfirm()),
        GetPage(name: '/login', page: () => const Login()) 
        //     desktopBody: const LogInPage(),
        //     mobileBody: const LogInMobilePage())),
      ];
  // \List<GetPage> get getRoute => _route;
  List<RouteModel> getNavbar() {
    List<RouteModel> list = [];
    for (RouteModel model in _navbar) {
      List<RouteToPage> listRouteToPage = [];
      listRouteToPage.addAll(_routeToPage
          .where((element) => element.name == model.route)
          .toList());
      if (listRouteToPage.isNotEmpty) {
        RouteToPage route = listRouteToPage.first;
        if (route.roles.isEmpty || route.roles.contains(appController.role)) {
          list.add(model);
        }
      }
    }
    return list;
  }

  List<RouteToPage> get getRouteToPage => _routeToPage;
}

class RouteModel {
  final String route;
  final String label;
  final String group;
  final List<RouteModel> children;
  final Widget screen;
  RouteModel(
      {required this.route,
      required this.label,
      required this.group,
      required this.children,
      required this.screen});
}

class RouteToPage {
  final String name;
  final Widget page;
  final List<String> roles;
  RouteToPage({required this.name, required this.page, required this.roles});
}
