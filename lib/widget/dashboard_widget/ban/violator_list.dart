import 'package:flutter/material.dart';

import '../../../api/api.dart';
import 'item_violator.dart';

class ViolatorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getListDenyNews(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < snapshot.data!.length; i++) ItemViolator(model: snapshot.data![i]),
          ],
        ),
      ),
    );
      }
      else{return CircularProgressIndicator();}
    },);
  }
}
