import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../../models/User_model/User.dart';
import '../dashboard/sidebar.dart';

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
                                            onPressed: () {},
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

/*List<DataRow> _vendordetails(
      QuerySnapshot snapshot, FirebaseServices services, bool cleared) {
    List<DataRow> newList = snapshot.docs.map((DocumentSnapshot document) {
      return DataRow(cells: [
        DataCell(Text(document.data()!['username'])),
        DataCell(Text(document.data()!['email'] ?? '')),
        DataCell(Text(document.data()!['username'])),
        DataCell(Text(document.data()!['Matric Number'])),


        DataCell(Text(document.data()!['email'])),
        DataCell(
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:document.data()!['cleared'] == true? Colors.green: Colors.grey,

              ),
            )
        ),
        DataCell(
            IconButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StudentDetails(
                      document.data()!['email'] ?? '',
                    );
                  });
            }, icon: Icon(Icons.details))
        ),
        // DataCell(Text(document.data()['email']))

        DataCell(GestureDetector(
          onTap: (){

            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: document.data()!['cleared'] == true? Text("Block"):  Text("Clear"),
                content: Text("Are you sure? "),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel")),
                  TextButton(onPressed: (){
                    services.clearedStudents(
                      id: document.data()!['email'],
                      cleared:  document.data()!['cleared'] ? false:true,
                    );
                    document.data()!['cleared']== true?
                    services.updateCleared(
                      email: document.data()!['email'] ,
                      date: DateFormat('yMMMd').format(DateTime.now()),
                    ):
                    services.updateBlocked(
                      email: document.data()!['email'] ,
                      date: DateFormat('yMMMd').format(DateTime.now()),
                    );
                    Navigator.pop(context);
                  }, child: Text("Confirm"))
                ],
              );
            });
          },



          child: Container(
            decoration: BoxDecoration(

                color: document.data()!['cleared'] ==true?Colors.green:Colors.red,
                borderRadius: BorderRadius.circular(2)
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: CustomText(
              text:document.data()!['cleared'] ==true? "Cleared": "Clear",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ]);
    }).toList();
    return newList;
  }*/
}

/*class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getListNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueGrey,
                      Colors.blueGrey,
                    ]),
              ),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LeftNavbar(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 8.8 / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            // Color.fromARGB(255, 60, 134, 245),

                                            Colors.pink,
                                            Colors.grey,
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          "Bài đang hiển thị",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontFamily: 'Merriweather'),
                                        ),
                                        Text(
                                          snapshot.data!.length.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Merriweather'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Danh sách bài đã đăng",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Merriweather'),
                                  ),
                                  Container(
                                    child: MaterialButton(
                                      color: Color.fromARGB(255, 227, 103, 145),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(28.0))),
                                      onPressed: () {
                                        Future.delayed(
                                                const Duration(seconds: 0))
                                            .then((value) async {
                                          Get.offAllNamed('/listConfirmNews');
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 5.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Bài đợi duyệt",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                              FutureBuilder(
                                                future:
                                                    api.getListConfirmNews(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      snapshot.data!.length
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 28.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Merriweather'),
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                },
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              NavTopListNews(),
                              Container(
                                color: Colors.white,
                                height: 1,
                                width: 1250,
                              ),
                              for (int i = 0; i < snapshot.data!.length; i++)
                                ItemListNews(model: snapshot.data![i]),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}*/
