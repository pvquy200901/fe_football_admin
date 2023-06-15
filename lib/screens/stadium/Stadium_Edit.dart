import 'package:flutter/material.dart';

import '../../models/Stadium_model/Stadium.dart';
import '../../widget/stadium/edit_stadium/item_edit_stadium.dart';

class StadiumEditView extends StatelessWidget {
  final listStadium model;
   const StadiumEditView({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemEditStadium(models:model ,),
            ],
          ),
        ),
      ),
    );
  }
}
