import 'package:fe_football_admin/screens/team/dialogDetailTeam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../../controller/app_controller.dart';
import '../../models/Team_model/team.dart';
import '../../widget/dialog/dialog_team_delete.dart';
import '../dashboard/sidebar.dart';

class TeamView extends StatefulWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {

  List<listTeam> m_teams = [];
  bool isLoading = false;
  int i =0;

  loadingData() async {
    setState(() {
      isLoading = true;
    });
    m_teams = await api.getListTeam();

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
      sideBar: sideBar.SideBarMenus(context, '/listTeam'),
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
                      padding: const EdgeInsets.only(
                          top: 28.0, left: 18.0, right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Danh sách các đội bóng",
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
                                  showBottomBorder: true,
                                  dataRowHeight: 90,
                                  headingRowColor: MaterialStateProperty.all(
                                    Colors.grey[200],
                                  ),
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('STT'),
                                    ),
                                    DataColumn(
                                      label: Text('Tên đội'),
                                    ),
                                    DataColumn(
                                      label: Text('Logo'),
                                    ),
                                    DataColumn(
                                      label: Text('Số điện thoại'),
                                    ),
                                    DataColumn(
                                      label: Text('Số lượng'),
                                    ),
                                    DataColumn(
                                      label: Text('Tùy chỉnh'),
                                    ),
                                  ],
                                  rows: m_teams.map((e) {
                                    i++;
                                    final DataRow dataRow = DataRow(cells: [
                                      DataCell(Text(i.toString())),
                                      DataCell(Text(e.name!)),
                                      DataCell( Padding(
                                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:e.logo!.isNotEmpty?
                                              NetworkImage("http://localhost:50000/api/File/image/${e.logo!}"): NetworkImage("https://img3.thuthuatphanmem.vn/uploads/2019/10/01/anh-logo-bong-da_103805455.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),),
                                      DataCell(Text(e.phone!)),
                                      DataCell(Text(e.quality!.toString())),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.article_outlined),
                                            color: dark.withOpacity(.7),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (BuildContext cxt) {
                                                    return DetailTeamDialog(
                                                      team: e.name!,
                                                    );
                                                  });
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: dark.withOpacity(.7),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (BuildContext cxt) {
                                                    return DialogTeamDelete(
                                                      team: e.name!,
                                                    );
                                                  });
                                            },
                                          ),
                                        ],
                                      ))
                                    ]);
                                    return dataRow;
                                  }).toList()),


                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

}

