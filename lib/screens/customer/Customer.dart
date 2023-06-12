import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../../controller/app_controller.dart';
import '../../models/User_model/User.dart';
import '../dashboard/sidebar.dart';
import 'dialogDetailCustomer.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {

  List<listUser> m_user = [];
  bool isLoading = false;
  int i =0;


  loadingData() async {
    setState(() {
      isLoading = true;
    });
    m_user = await api.getListUser();

    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    loadingData();
    if(appController.token.isEmpty){
      appController.getLoginData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();

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

      ),
      sideBar: _sideBar.SideBarMenus(context, '/listUser'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                            "Danh sách khách hàng",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
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
                                      label: Text('Họ tên'),
                                    ),
                                    DataColumn(
                                      label: Text('Email'),
                                    ),
                                    DataColumn(
                                      label: Text('Số điện thoại'),
                                    ),
                                    DataColumn(
                                      label: Text('Ngày sinh'),
                                    ),
                                    DataColumn(
                                      label: Text('Tùy chỉnh'),
                                    ),
                                  ],
                                  rows:
                                  m_user.map((e) {
                                    i++;
                                    final DataRow dataRow = DataRow(cells: [
                                      DataCell(Text(i.toString())),
                                      DataCell(Text(e.name!)),
                                      DataCell(Text(e.email!)),
                                      DataCell(Text(e.phone!)),
                                      DataCell(Text(e.birthday!)),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.article_outlined),
                                            color: dark.withOpacity(.7),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (BuildContext cxt) {
                                                    return new DetailCustomerDialog(
                                                     username: e.username!,
                                                    );
                                                  });
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: dark.withOpacity(.7),
                                            onPressed: () {
                                              api.deleteUser(e.username).then((value){
                                                if (value){
                                                  Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                    Get.offAllNamed('/listUser');
                                                  });
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ))
                                    ]);
                                    return dataRow;
                                  }).toList()
                          ),
                          )],
                      ),
                    ),
                  ),
                ),
              ],
            )

        ),
      ),
    );
  }

}

