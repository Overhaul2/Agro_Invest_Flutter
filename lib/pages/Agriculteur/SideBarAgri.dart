import 'package:agro_invest/model/AgriculteurModele.dart';
import 'package:agro_invest/pages/Investisseur/ProfileInvestisseurPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/AgriculteurPovider.dart';
import '../../Provider/InvestisseurProvider.dart';
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
                  return Text("+223 $Tel" ,style: TextStyle(color: Colors.white,fontSize:20 ),);/*style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
                  ),);*/
                } else {
                  return Text("+223", style: TextStyle(color: Colors.white));
                }
              } else {
                return Text("+223 xxxxxxxx");
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

  late Agriculteur agriculteur;
  @override
  void initState() {
    // TODO: implement initState
    agriculteur = Provider.of<AgriculteurProvider>(context, listen: false).agriculteur!;

  }
  if (agriculteurProvider.agriculteur != null &&
      agriculteurProvider.agriculteur!.image != null) {
    return DecorationImage(
        image: NetworkImage( "http://10.0.2.2/" + agriculteur!.image!)
    );
  } else {
    return DecorationImage(
      image: AssetImage("asset/images/user1.png"),
    );
  }
}