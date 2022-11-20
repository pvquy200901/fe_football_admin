import 'package:flutter/material.dart';

String noidung =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu finibus tellus. Quisque nec luctus ligula. Nullam molestie non nunc eget accumsan. Integer eu enim diam. Maecenas rutrum a tortor eleifend faucibus. Etiam sollicitudin dui vel odio elementum maximus. Nulla in aliquet tellus, ut aliquam orci. Pellentesque imperdiet neque vitae dapibus interdum. Nunc id rhoncus tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec feugiat arcu ac nibh ullamcorper pellentesque eu non justo. Phasellus in magna quis sem suscipit dignissim quis ut dui\n Sed lectus turpis, congue a dui vitae, malesuada tempor turpis. Vestibulum leo ligula, fringilla ultricies lectus eu, blandit ultricies tellus. Proin tincidunt ex sed sollicitudin dapibus. Nunc convallis justo non lectus iaculis, at gravida dui semper. Aliquam eu nisi at erat malesuada dictum. Morbi a leo id quam tincidunt aliquam accumsan nec sem. Etiam ac laoreet erat. Quisque risus tortor, elementum id varius sit amet, vulputate at elit. Sed metus nunc, venenatis volutpat tincidunt semper, interdum et nulla. Phasellus et lacinia elit, non vehicula nisi. Mauris sollicitudin tempus neque, sit amet mollis massa tempor at. Duis porta venenatis viverra. Quisque viverra urna ac gravida mattis. Etiam sit amet faucibus metus. Curabitur metus risus, accumsan in velit a, consectetur tincidunt elit. Integer sed lacinia elit.";

class ItemNewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                    'Lorem ipsum dolor sit amet',
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
                    '18/11/2022 20:55',
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
                                noidung,
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
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
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
}
