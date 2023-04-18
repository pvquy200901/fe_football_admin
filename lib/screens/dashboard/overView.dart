import 'package:fe_football_admin/models/Team_model/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../api/api.dart';
import '../../models/News_model/news.dart';
import '../../models/Order_model/listOrder.dart';
import '../../widget/dialog/dialog_confirm_ban.dart';
import '../../widget/dialog/dialog_detail_warning.dart';
import 'infoCard.dart';

class OverviewCards extends StatefulWidget {
  const OverviewCards({Key? key}) : super(key: key);

  @override
  State<OverviewCards> createState() => _OverviewCardsState();
}

class _OverviewCardsState extends State<OverviewCards> {
  String? dataLength;
  String? bursary;
  bool isLoading = false;
  List<listOrder> orderInDay = [];
  List<listOrder> orderConfirm = [];
  List<News> listConfirmNews = [];
  List<NewsV2> listDenyNews = [];
  List<listTeam> listTeams = [];
  double priceInDay =0;
  double priceInMonth =0;
  int i = 0;

  loadData() async {
    setState(() {
      isLoading = true;
    });
    orderInDay = await api.getListOrderToday();
    orderConfirm = await api.getListConfirmOrder();
    listConfirmNews = await api.getListConfirmNews();
    listTeams = await api.getListTeam();
    priceInDay = await api.totalPriceToday();
    priceInMonth = await api.totalPriceMonth();
    listDenyNews = await api.getListDenyNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return isLoading
        ? Container(
            width: 100,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          )
        : Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, left: 18.0, right: 18.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tổng quan",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Số trận trong ngày',
                                value: orderInDay.length.toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                              SizedBox(
                                width: _width / 64,
                              ),
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Số tin đợi duyệt',
                                value: listConfirmNews.length.toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                              SizedBox(
                                width: _width / 64,
                              ),
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Danh sách đơn đặt sân',
                                value: orderConfirm.length.toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                              // St
                              SizedBox(
                                width: _width / 64,
                              ),
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Tổng số đội',
                                value: listTeams.length.toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                          ),
                          Row(
                            children: [
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Doanh thu theo ngày',
                                value: priceInDay.toVND().toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                              SizedBox(
                                width: _width / 64,
                              ),
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Doanh thu theo tháng',
                                value: priceInMonth.toVND().toString(),
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                              SizedBox(
                                width: _width / 64,
                              ),
                              InfoCard(
                                bezierCOlor: Colors.blue,
                                title: 'Doang thu theo năm',
                                value: "500.000.000 đ",
                                onTap: () {},
                                topColor: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, left: 18.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Danh sách các bài đăng vi phạm",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(columns: [
                              DataColumn(
                                  label: Text('STT',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Người đăng',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Tiêu đề',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Chi tiết',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Cảnh báo',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ], rows: listDenyNews.map((e){
                              i++;
                              final DataRow dataRow = DataRow(
                                cells: [
                                  DataCell(Text(i.toString())),
                                  DataCell(Text(e.name!)),
                                  DataCell(Text(e.title!)),
                                  DataCell(MaterialButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext cxt) {
                                            return new DialogConfirmBan();
                                          });
                                    },
                                    child: Text(
                                      "Cấm",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Merriweather'),
                                    ),
                                  )),
                                  DataCell(MaterialButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext cxt) {
                                            return new DialogConfirmWarning(
                                              email: e.email!,
                                              name: e.name!,
                                            );
                                          });
                                    },
                                    child: Text(
                                      "Cảnh cáo",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Merriweather'),
                                    ),
                                  )),
                                ],
                              );
                              return dataRow;
                            }).toList()),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
