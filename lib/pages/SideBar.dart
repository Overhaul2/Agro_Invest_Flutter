import 'package:flutter/material.dart';

class MonHearderDrawer extends StatefulWidget {
  const MonHearderDrawer({Key? key}) : super(key: key);

  @override
  State<MonHearderDrawer> createState() => _MonHearderDrawerState();
}

class _MonHearderDrawerState extends State<MonHearderDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xA8008000),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("asset/images/user1.png"),
              )
            ),
          ),
          Text("Souleymane",
          style: TextStyle(color: Colors.white,
          fontSize: 30,),),
        ],
      ),
    );
  }
}
