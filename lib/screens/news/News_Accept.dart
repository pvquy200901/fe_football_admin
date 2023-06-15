import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:fe_football_admin/widget/news/item_list_news_wait.dart';
import 'package:fe_football_admin/widget/news/nav_news/nav_top_list_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class NewsAcceptView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getListConfirmNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
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
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 8.8 / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: const BoxDecoration(
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
                                        const Text(
                                          "Bài đợi duyệt",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontFamily: 'Merriweather'),
                                        ),
                                        Text(
                                          snapshot.data!.length.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Merriweather'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    "Danh sách bài chờ phê duyệt",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Merriweather'),
                                  ),
                                  MaterialButton(
                                    color: const Color.fromARGB(255, 227, 103, 145),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(28.0))),
                                    onPressed: () {
                                    Future.delayed(
                                              const Duration(seconds: 0))
                                          .then((value) async {
                                        Get.offAllNamed('/listNews');
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 5.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Bài đã duyệt",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                             FutureBuilder(
                                              future: api.getListNews(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return  Text(
                                                    snapshot.data!.length.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Merriweather'),
                                                  );
                                                } else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            )
                                          ]),
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
                              for (int i = 0; i < snapshot.data!.length; i++) ItemListNewsWait(model: snapshot.data![i]),
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
