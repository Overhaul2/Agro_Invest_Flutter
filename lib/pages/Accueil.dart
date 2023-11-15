import 'package:agro_invest/pages/SideBar.dart';
import 'package:agro_invest/pages/SideBarre/Parametre.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  var currentPage=DrawersSection.Parametre;
  @override
  Widget build(BuildContext context) {
    var container;

    if(currentPage==DrawersSection.Parametre){
     container=ParametrePage();
    }else if(currentPage==DrawersSection.Apropos){
      container=ParametrePage();
    }else if(currentPage==DrawersSection.Contacter_le_Supports){
      container=ParametrePage();
    }else if(currentPage==DrawersSection.Aide)
      {container=ParametrePage();
    }else if(currentPage==DrawersSection.Partager_lapplication)
      {container=ParametrePage();
    }else if(currentPage==DrawersSection.noter){
      container=ParametrePage();
    }else if(currentPage==DrawersSection.Se_Deconnecter){
      container=ParametrePage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Container(),
      drawer: Drawer(child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                  MonHearderDrawer(),
                  MonheaderDrawerList(),
            ],
          ),
        ),
      ),),
    );

  }

  Widget MonheaderDrawerList(){
    return Container(
            padding: EdgeInsets.only(top: 15,),
      child: Column(
      //liste des menu drawer
        children: [
          menuItem(1,"Paramètre", Icons.settings,
          currentPage==DrawersSection.Parametre? true:false),
          menuItem(2,"Apropos", Icons.info_outline,
              currentPage==DrawersSection.Apropos? true:false),
          menuItem(3,"Contacter le Support", Icons.contact_support_outlined,
              currentPage==DrawersSection.Contacter_le_Supports? true:false),
          menuItem(4,"Aide", Icons.add_task,
              currentPage==DrawersSection.Aide? true:false),
          menuItem(5,"Partager l'Application", Icons.settings,
              currentPage==DrawersSection.Partager_lapplication? true:false),
          menuItem(6,"Noter l'Application", Icons.feedback_outlined,
              currentPage==DrawersSection? true:false),
          menuItem(7,"Se Deconnecter", Icons.logout,
              currentPage==DrawersSection.Se_Deconnecter? true:false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title,IconData icon,bool selected){
    return Material(
      color: selected? Colors.green: Colors.transparent ,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id==1){
              currentPage=DrawersSection.Parametre;
            }else if(id==2){
              currentPage=DrawersSection.Apropos;
            }else if(id==3){
              currentPage=DrawersSection.Contacter_le_Supports;
            }else if(id==4){
              currentPage=DrawersSection.Aide;
            }else if(id==5){
              currentPage=DrawersSection.Partager_lapplication;
            }else if(id==6){
              currentPage=DrawersSection.noter;
            }else if(id==7){
              currentPage=DrawersSection.Se_Deconnecter;
            }
          });
        } ,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child:Row(
            children: [
            Expanded(
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.black87,)),
            Expanded(
              flex: 3,
              child: Text(title,
                style: TextStyle(color: Colors.black87,
                    fontSize: 20,
                fontWeight: FontWeight.bold),
              ),),
          ],) ,
        ),
      ),

    );
  }

}
enum DrawersSection{
  Parametre,
  Apropos,
  Contacter_le_Supports,
  Aide,
  Partager_lapplication,
  noter,
  Se_Deconnecter,
}
