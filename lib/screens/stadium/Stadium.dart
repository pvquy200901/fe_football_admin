
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
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
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();

    bool cleared = false;

    var data;
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
              IconButton(
                icon: const Icon(Icons.settings),
                color: dark.withOpacity(.7),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: dark.withOpacity(.7),
                    ),
                  ),
                  Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                          width: 12,
                          height: 12,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: light, width: 2))))
                ],
              ),
              Container(
                width: 1,
                height: 22,
                color: lightgrey,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(
                      Icons.person_outline,
                      color: dark,
                    ),
                  ),
                ),
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: dark,
          ),
          backgroundColor: light,
          // iconTheme: IconThemeData(
          //   color: Colors.white,
          // ),
          // title: Text(
          //   'Gobike dashboard'.toUpperCase(),
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.w900,
          //     fontSize: 19,
          //   ),
          // ),
        ),
        sideBar: _sideBar.SideBarMenus(context, '/listStadium'),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
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
                                return new createStadiumView();
                              });
                        },
                        child: Text(
                          "Thêm sân bóng",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Merriweather'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: DataTable(
                            showBottomBorder: true,
                            dataRowHeight: 60,
                            headingRowColor: MaterialStateProperty.all(
                              Colors.grey[200],
                            ),
                            columns: <DataColumn>[
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
                                              return new EditInfoDialog(
                                                name: e.name!,
                                                address: e.address!,
                                                contact: e.contact!,
                                                price: e.price!,
                                                latitude: e.latitude!,
                                                longtitude: e.longtitude!,
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
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ))
                              ]);
                              return dataRow;
                            }).toList()),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}

