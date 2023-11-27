import 'package:agro_invest/Provider/InvestisseurProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/AgriculteurPovider.dart';
import '../Agriculteur/ProfilePage.dart';

class MonHearderDrawerinvest extends StatefulWidget {
  const MonHearderDrawerinvest({Key? key}) : super(key: key);

  @override
  State<MonHearderDrawerinvest> createState() => _MonHearderDrawerinvestState();
}

class _MonHearderDrawerinvestState extends State<MonHearderDrawerinvest> {
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
          Consumer<InvestisseurProvider>(
            builder: (context, investisseurProvider, _) {
              if (investisseurProvider.investisseur != null) {
                int? Tel = investisseurProvider.investisseur!.telephone;
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
  final investisseurProvider = Provider.of<InvestisseurProvider>(context, listen: false);

  if (investisseurProvider.investisseur != null &&
      investisseurProvider.investisseur!.image != null) {
    return DecorationImage(
      image: NetworkImage(investisseurProvider.investisseur!.image!)
    );
  } else {
    return DecorationImage(
      image: AssetImage("asset/images/user1.png"),
    );
  }
}
