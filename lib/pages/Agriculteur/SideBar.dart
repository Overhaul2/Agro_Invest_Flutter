import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/AgriculteurPovider.dart';
import 'ProfilePage.dart';

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
      height: 250,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfil()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: _buildImageProvider(context),
              ),
            ),
          ),
          Consumer<AgriculteurProvider>(
            builder: (context, agriculteurProvider, _) {
              if (agriculteurProvider.agriculteur != null) {
                int? Tel = agriculteurProvider.agriculteur!.telephone;
                if (Tel != null) {
                  return Text("+223 $Tel" ,style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
                  ),);
                } else {
                  return Text("+223", style: TextStyle(color: Colors.black87));
                }
              } else {
                return Text("");
              }
            },
          ),
        ],
      ),
    );
  }
}
DecorationImage _buildImageProvider(BuildContext context) {
  final agriculteurProvider = Provider.of<AgriculteurProvider>(context, listen: false);

  if (agriculteurProvider.agriculteur != null &&
      agriculteurProvider.agriculteur!.image != null) {
    return DecorationImage(
      image: NetworkImage(agriculteurProvider.agriculteur!.image!)
    );
  } else {
    return DecorationImage(
      image: AssetImage("asset/images/user1.png"),
    );
  }
}
