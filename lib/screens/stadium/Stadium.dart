import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../../controller/app_controller.dart';
import '../../models/Stadium_model/Stadium.dart';
import '../dashboard/sidebar.dart';
import 'create_stadium.dart';
import 'dialogCreateStadium.dart';

class StadiumView extends StatefulWidget {
  const StadiumView({Key? key}) : super(key: key);

  @override
  _StadiumViewState createState() => _StadiumViewState();
}

class _StadiumViewState extends State<StadiumView> {
  List<listStadium> stadiums = [];
  bool isLoading = false;
  int i = 0;
  loadingData() async {
    setState(() {
      isLoading = true;
    });
    stadiums = await api.getListStadium();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(appController.token.isEmpty){
      appController.getLoginData();
    }
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    SideBarWidget sideBar = SideBarWidget();
    return AdminScaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Visibility(
                  child: CustomText(
                    text: 'Quản lý hệ thống',
                    color: lightgrey,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: light,
                        child:  IconButton(
                          icon: const Icon(Icons.person),
                          color: dark.withOpacity(.7),
                          onPressed: () {
                            setState(() {
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: dark,
          ),
          backgroundColor: light,

        ),
        sideBar: sideBar.SideBarMenus(context, '/listStadium'),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top:28.0, left: 18.0, right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quản lý sân",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext cxt) {
                                      return const createStadiumView();
                                    });
                              },
                              child: const Text(
                                "Thêm sân bóng",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Merriweather'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                                showBottomBorder: true,
                                dataRowHeight: 60,
                                headingRowColor: MaterialStateProperty.all(
                                  Colors.grey[200],
                                ),
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('STT'),
                                  ),
                                  DataColumn(
                                    label: Text('Tên sân'),
                                  ),
                                  DataColumn(
                                    label: Text('Địa chỉ'),
                                  ),
                                  DataColumn(
                                    label: Text('Số điện thoại'),
                                  ),
                                  DataColumn(
                                    label: Text('Giá tiền'),
                                  ),
                                  DataColumn(
                                    label: Text('Ảnh'),
                                  ),
                                  DataColumn(
                                    label: Text('Tùy chỉnh'),
                                  ),
                                ],
                                rows: stadiums.map((e) {
                                  i++;
                                  final DataRow dataRow = DataRow(cells: [
                                    DataCell(Text(i.toString())),
                                    DataCell(Text(e.name!)),
                                    DataCell(Text(e.address!)),
                                    DataCell(Text(e.contact!)),
                                    DataCell(Text(e.price.toVND())),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  e.images!.isNotEmpty?"http://localhost:50000/api/File/image/${e.images![0]}": "https://img3.thuthuatphanmem.vn/uploads/2019/10/01/anh-logo-bong-da_103805455.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          color: dark.withOpacity(.7),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder: (BuildContext cxt) {
                                                  return EditInfoDialog(
                                                    name: e.name!,
                                                    address: e.address!,
                                                    contact: e.contact!,
                                                    price: e.price!,
                                                    latitude: e.latitude!,
                                                    longtitude: e.longtitude!,
                                                    images: e.images!,
                                                  );
                                                });
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          color: dark.withOpacity(.7),
                                          onPressed: () {
                                            api.deleteStadium(e.name!).then((value){
                                              if (value){
                                                Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                  Get.offAllNamed('/listStadium');
                                                });
                                                Fluttertoast.showToast(
                                                    msg: "Đã xóa thành công",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.TOP_RIGHT,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.green,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0
                                                );
                                              }
                                              else{
                                                Fluttertoast.showToast(
                                                    msg: "Không thể xóa",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.TOP_RIGHT,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.redAccent,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ))
                                  ]);
                                  return dataRow;
                                }).toList()),
                          )],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

