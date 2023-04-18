import 'package:fe_football_admin/screens/dashboard/menuItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SideBarWidget{
  SideBarMenus(context, selectedRoute){
    return SideBar(
      activeBackgroundColor: CupertinoColors.systemBlue,
      activeIconColor: Colors.white,
      iconColor: CupertinoColors.systemBlue,
      textStyle: GoogleFonts.poppins(
        color: Colors.grey[700],
        fontSize: 13,
      ),
      activeTextStyle: TextStyle(
        color: Colors.white,
      ),
      // backgroundColor: Colors.black54,
      items: [
        AdminMenuItem(
          title: 'Thống kê',
          route: '/dashboardView',
          icon: Icons.dashboard,
        ),
        AdminMenuItem(
          title: 'Quản lý sân',
          route: '/listStadium',
          icon: Icons.height_outlined,
        ),
        AdminMenuItem(
          title: 'Đặt sân',
          route: '/order',
          icon: Icons.person_outlined,
        ),
        AdminMenuItem(
          title: 'Quản lý bài đăng',
          route: '/listNews',
          icon: Icons.person_outlined,
        ),
        AdminMenuItem(
          title: 'Quản lý khách hàng',
          route: '/listUser',
          icon: Icons.person_outlined,
        ),
        AdminMenuItem(
          title: 'Quản lý đội bóng',
          route: '/listTeam',
          icon: Icons.person_outlined,
        ),


      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        Navigator.of(context).pushNamed(item.route!);
      },

      // footer: Container(
      //   height: 50,
      //   width: double.infinity,
      //   color: Colors.black26,
      //   child: Center(
      //     child: Text(
      //       'footer',
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}