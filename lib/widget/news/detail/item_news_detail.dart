import 'package:flutter/material.dart';

import '../../../api/api.dart';


class ItemNewsDetail extends StatelessWidget {
  final String code;
  const ItemNewsDetail({super.key, required this.code});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: api.getInfoNewsForAdmin(code),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        List<String> img = snapshot.data!.imagesNews!;
        return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        width: width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.createdTime!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: 450,
                    ),
                  ]),
              Container(
                width: width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 2.0, // gap between adjacent chips
                      runSpacing: 1.0, // gap between lines
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.description!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ])
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 2.0, // gap between adjacent chips
                      runSpacing: 1.0, // gap between lines
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                for(int i = 0; i <img.length ; i ++)
                                      ClipRRect(
                                        child: SizedBox.fromSize(
                                          size:
                                              Size.fromRadius(95), // Image radius
                                          child: Image.network(
                                              'http://localhost:50000/api/File/image/${img[i]}',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                
                            ]),
                        // Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       ClipRRect(
                        //         child: SizedBox.fromSize(
                        //           size: Size.fromRadius(95), // Image radius
                        //           child: Image.network('assets/add-image.png',
                        //               fit: BoxFit.cover),
                        //         ),
                        //       ),
                        //       ClipRRect(
                        //         child: SizedBox.fromSize(
                        //           size: Size.fromRadius(95), // Image radius
                        //           child: Image.network('assets/add-image.png',
                        //               fit: BoxFit.cover),
                        //         ),
                        //       ),
                        //     ]),
                        // Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       ClipRRect(
                        //         child: SizedBox.fromSize(
                        //           size: Size.fromRadius(95), // Image radius
                        //           child: Image.network('assets/add-image.png',
                        //               fit: BoxFit.cover),
                        //         ),
                        //       ),
                        //       ClipRRect(
                        //         child: SizedBox.fromSize(
                        //           size: Size.fromRadius(95), // Image radius
                        //           child: Image.network('assets/add-image.png',
                        //               fit: BoxFit.cover),
                        //         ),
                        //       ),
                        //     ]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                height: 1,
                width: 1250,
              ),
              SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  
      }
      else{return CircularProgressIndicator();}
    },);
  }
}
