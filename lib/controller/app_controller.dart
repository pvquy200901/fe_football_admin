
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../config/route_config.dart';
import '../screens/dashboard/Dashboard.dart';
import '../utils/session_storage_helper.dart';
import '../widget/sweet_alert.dart';
import 'loading_controller.dart';
import 'notification_controller.dart';

// import '../code_cua_hung/config/config_account.dart';
typedef void MenuCallback(ObjectKey);

class AppController extends GetxController {
  final PushNotificationStream pushNotificationStream =
      PushNotificationStream();
  final LoadingStream loadingStream = LoadingStream();
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;
  String errorLog = '';
  String sucssesLog = '';
  String token = '';
  String user = '';
  String password = '';
  String role = '';
  String mainSlug = '';
  RxBool isSmall = false.obs;
  final Rx<RouteModel> currentRoute = RouteModel(
          route: '/dashboard',
          label: 'Bảng thống kê',
          group: '/',
          children: [],
          screen: DashboardView())
      .obs;
  List<String> listCustomer = [];
  List<String> listCodeBuy = [];
  List<String> listName = [];
  List<String> listUser = [];
  List<String> listProductType = [];
  List<String> listPackageType = [];
  List<String> listProduct = [''];
  List<String> listPosition = [];
  // Rx<Country> language = countries.where((element) => (element.code == 'VN')).first.obs;
  // List<Country> listLanguage = countries.where((element) => (['VN','US'].contains(element.code))).toList();
  List<Map<String, dynamic>> reportData = [];
  final DataGridController dataGridController = DataGridController();
  final RxBool showMessage = false.obs;
  Widget message = const SweetAlert(message: '');

  // Locale myLocale(){
  //   return Locale(language.value.locale,language.value.code);
  // }

  void toastError(String title) {
    Get.snackbar(title, errorLog, backgroundColor: Colors.red);
  }

  void toastSucsses(String title) {
    Get.snackbar(title, sucssesLog,
        backgroundColor: Color.fromARGB(255, 20, 4, 247));
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  String getMoneyFormat(dynamic money, {int precision = 0}) {
    double moneyFormat = 0.0;
    if (money == null) return '0';
    if (money is String) {
      moneyFormat = double.parse(money);
    } else if (money is int) {
      moneyFormat = money * 1.0;
    } else {
      moneyFormat = money;
    }

    String prefix = '';
    if (moneyFormat < 0) prefix = '-';

    var controller = MoneyMaskedTextController(
        decimalSeparator: (precision == 0) ? '' : ',',
        thousandSeparator: ',',
        precision: precision);

    controller.updateValue(moneyFormat);

    if (money == null) return '';
    return prefix + controller.text;
  }

  String buildContent(String s) {
    return '     $s';
  }

  @override
  void onInit() {
    super.onInit();
  }

  _saveRoute() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('route', currentRoute.value.route);
    pref.setString('label', currentRoute.value.label);
    pref.setString('group', currentRoute.value.group);
  }

  changeRoute(RouteModel route) async {
    try {
      RouteToPage routeToPage = RouteConfig()
          .getRouteToPage
          .where((element) => element.name == route.route)
          .toList()
          .first;
      if (routeToPage.roles.isEmpty || routeToPage.roles.contains(role)) {
        currentRoute.value = route;
        _saveRoute();
      } else {
        Get.toNamed('/permission_denied');
      }
    } catch (e) {
      Get.toNamed('/permission_denied');
    }
  }

  // Future getAllData() async{
  //   await api.getListCustomer();
  //   await api.getListProduct();
  //   await api.getListProductType();
  //   await api.getListPackageType();
  //   await api.getListPosition();
  //   await api.getListJobConfigOption();
  //   await api.getListCodeBuy();
  //   await api.getListCompanyPosition();
  // }

  Future getLoginData() async {
    token = SessionStorageHelper.getValue('token');
    user = SessionStorageHelper.getValue('user');
    role = SessionStorageHelper.getValue('role');
  }

  Future setLoginData(data) async {
    SessionStorageHelper.setValue('token', data['token']);
    SessionStorageHelper.setValue('user', data['user']);
    SessionStorageHelper.setValue('role', data['role']);
    await getLoginData();
  }

  Future resetLoginData() async {
    SessionStorageHelper.clearAll();
    var pref = await SharedPreferences.getInstance();
    pref.setString('route', '');
    pref.setString('label', '');
    pref.setString('group', '');
    await getLoginData();
  }

  loadingData([redirect = true]) async {
    // try{
    //   isLoading.value = true;
    //   await getLoginData();
    //   if (token.isNotEmpty) {
    //     // await getAllData();
    //     if (redirect) {
    //       isLoading.value = false;
    //       if(role != 'transport') {
    //         Future.delayed(Duration.zero).then((value) =>
    //             Get.offAllNamed('/home'));
    //       }else{
    //         Future.delayed(Duration.zero).then((value) =>
    //             Get.offAllNamed('/order'));
    //       }
    //     } else {
    //       var pref = await SharedPreferences.getInstance();
    //       String route = pref.getString('route') ?? '';
    //       String label = pref.getString('label') ?? '';
    //       String group = pref.getString('group') ?? '';
    //       if (Get.currentRoute == '/home') {
    //         if (route.isNotEmpty) {
    //           RouteToPage routeToPage = RouteConfig().getRouteToPage
    //               .where((element) => element.name == route)
    //               .first;
    //           changeRoute(RouteModel(route: routeToPage.name,
    //               label: label,
    //               group: group,
    //               children: [],
    //               screen: routeToPage.page));
    //         } else {
    //           changeRoute(RouteModel(
    //               route: '/danh_sach_duong_pho',
    //               label: 'Home',
    //               group: '/danh_sach_duong_pho',
    //               children: [],
    //               screen: ListStreetsScreen()));
    //         }
    //       }
    //       isLoading.value = false;
    //     }
    //   }
    //   else {
    //     print('get token error');
    //     isLoading.value = false;
    //     Future.delayed(Duration.zero).then((value) =>
    //         Get.offAllNamed('/login'));
    //   }
    // }catch(e){
    //   print('error');
    //   isLoading.value = false;
    //   await resetLoginData();
    //   Future.delayed(Duration.zero).then((value) =>
    //       Get.offAllNamed('/danh_sach_duong_pho'));
    // }
  }

  void initRoute() {
    // appController.currentRoute.value = RouteModel(
    //     route: '/danh_sach_duong_pho',
    //     label: 'Thống kê xuất nhập',
    //     group: '/danh_sach_duong_pho',
    //     children: [],
    //     screen: ListStreetsScreen());
  }
}

final AppController appController = Get.put(AppController());
