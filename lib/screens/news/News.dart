import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../../controller/app_controller.dart';
import '../../models/News_model/news.dart';
import '../../widget/dialog/dialog_detail_warning.dart';
import '../dashboard/sidebar.dart';
import 'dialogDetailNews.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<News> listNews = [];
  List<News> listConfirm = [];
  bool isLoading = false;
  int i =0;
  int j = 0;

  loadingData() async {
    setState(() {
      isLoading = true;
    });
    listNews = await api.getListNews();
    listConfirm = await api.getListConfirmNews();

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
    double _width = MediaQuery.of(context).size.width;

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

        ),
        sideBar: _sideBar.SideBarMenus(context, '/listNews'),
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
                                "Danh sách các bài đăng",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DataTable(
                                    columnSpacing: 20.0,
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
                                        label: Text('Người đăng'),
                                      ),
                                      DataColumn(
                                        label: Text('Tiêu đề'),
                                      ),
                                      DataColumn(
                                        label: Text('Thời gian'),
                                      ),
                                      DataColumn(
                                        label: Text('Tùy chỉnh'),
                                      ),
                                    ],
                                    rows: listNews.map((e) {
                                      j++;
                                      final DataRow dataRow = DataRow(cells: [
                                        DataCell(Text(j.toString())),
                                        DataCell(Text(e.user!)),
                                        DataCell(
                                            ConstrainedBox(
                                                constraints: BoxConstraints(maxWidth: 500), //SET max width
                                                child: Text( e.title!,
                                                    overflow: TextOverflow.ellipsis))),
                                        DataCell(Text(e.createdTime!)),
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
                                                      return DetailNewsDialog(
                                                        name: e.code!,
                                                      );
                                                    });
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              color: dark.withOpacity(.7),
                                              onPressed: () {
                                                api.removeNews(e.code).then((value){
                                                  if (value){
                                                    Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                      Get.offAllNamed('/listNews');
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
                              )
                              ,
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10,),
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
                                "Danh sách các bài đợi duyệt",
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
                                    columnSpacing: 120.0,
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
                                        label: Text('Người đăng'),
                                      ),
                                      DataColumn(
                                        label: Text('Tiêu đề'),
                                      ),
                                      DataColumn(
                                        label: Text('Thời gian'),
                                      ),
                                      DataColumn(
                                        label: Text('Tùy chỉnh'),
                                      ),
                                    ],
                                    rows: listConfirm.map((e) {
                                      i++;
                                      final DataRow dataRow = DataRow(cells: [
                                        DataCell(Text(i.toString())),
                                        DataCell(Text(e.user!)),
                                        DataCell(ConstrainedBox(
                                            constraints: BoxConstraints(maxWidth: 500), //SET max width
                                            child: Text( e.title!,
                                                overflow: TextOverflow.ellipsis))),
                                        DataCell(Text(e.createdTime!)),
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
                                                      return new DetailNewsDialog(
                                                        name: e.code!,
                                                      );
                                                    });
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add_task),
                                              color: dark.withOpacity(.7),
                                              onPressed: () {
                                                api.confirmNews(e.code).then((value){
                                                  if (value){
                                                    Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                      Get.offAllNamed('/listNews');
                                                    });
                                                  }
                                                });
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              color: dark.withOpacity(.7),
                                              onPressed: () {
                                                api.removeNews(e.code).then((value){
                                                  if (value){
                                                    Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                      Get.offAllNamed('/listNews');
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
                              )
                              ,
                            ],
                          ),
                        ),
                      ),
                    ),
                   /* SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top:28.0, left: 18.0, right: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Danh sách các bài đăng",
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: DataTable(
                                            columnSpacing: 20.0,
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
                                                label: Text('Người đăng'),
                                              ),
                                              DataColumn(
                                                label: Text('Tiêu đề'),
                                              ),
                                              DataColumn(
                                                label: Text('Thời gian'),
                                              ),
                                              DataColumn(
                                                label: Text('Tùy chỉnh'),
                                              ),
                                            ],
                                            rows: listNews.map((e) {
                                              j++;
                                              final DataRow dataRow = DataRow(cells: [
                                                DataCell(Text(j.toString())),
                                                DataCell(Text(e.user!)),
                                                DataCell(
                                                    ConstrainedBox(
                                              constraints: BoxConstraints(maxWidth: 500), //SET max width
                                              child: Text( e.title!,
                                              overflow: TextOverflow.ellipsis))),
                                                DataCell(Text(e.createdTime!)),
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
                                                              return DetailNewsDialog(
                                                                name: e.code!,
                                                              );
                                                            });
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons.delete),
                                                      color: dark.withOpacity(.7),
                                                      onPressed: () {
                                                        api.removeNews(e.code).then((value){
                                                          if (value){
                                                            Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                              Get.offAllNamed('/listNews');
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
                                    )
                                ,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/10,),
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
                                "Danh sách các bài đợi duyệt",
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

                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                        columnSpacing: 120.0,
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
                                            label: Text('Người đăng'),
                                          ),
                                          DataColumn(
                                            label: Text('Tiêu đề'),
                                          ),
                                          DataColumn(
                                            label: Text('Thời gian'),
                                          ),
                                          DataColumn(
                                            label: Text('Tùy chỉnh'),
                                          ),
                                        ],
                                        rows: listConfirm.map((e) {
                                          i++;
                                          final DataRow dataRow = DataRow(cells: [
                                            DataCell(Text(i.toString())),
                                            DataCell(Text(e.user!)),
                                            DataCell(ConstrainedBox(
                                                constraints: BoxConstraints(maxWidth: 500), //SET max width
                                                child: Text( e.title!,
                                                    overflow: TextOverflow.ellipsis))),
                                            DataCell(Text(e.createdTime!)),
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
                                                          return new DetailNewsDialog(
                                                            name: e.code!,
                                                          );
                                                        });
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add_task),
                                                  color: dark.withOpacity(.7),
                                                  onPressed: () {
                                                    api.confirmNews(e.code).then((value){
                                                      if (value){
                                                        Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                          Get.offAllNamed('/listNews');
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.delete),
                                                  color: dark.withOpacity(.7),
                                                  onPressed: () {
                                                    api.removeNews(e.code).then((value){
                                                      if (value){
                                                        Future.delayed(const Duration(seconds: 0)).then((value) async {
                                                          Get.offAllNamed('/listNews');
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
                                )
                              ,
                            ],
                          ),
                        ),
                      ),
                    ),*/

                  ],
                )

            ),
          ),
        );
  }

}

