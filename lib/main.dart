import 'package:fe_football_admin/screens/customer/Customer.dart';
import 'package:fe_football_admin/screens/dashboard/Dashboard.dart';
import 'package:fe_football_admin/screens/Login.dart';
import 'package:fe_football_admin/screens/news/News.dart';
import 'package:fe_football_admin/screens/selling/Selling.dart';
import 'package:fe_football_admin/screens/stadium/Stadium.dart';
import 'package:fe_football_admin/screens/team/Team.dart';
import 'package:fe_football_admin/widget/dashboard_widget/top_team/top_team_order_list.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var title = "QDN - Football";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: SellingView(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
      ),
    );
  }
}
