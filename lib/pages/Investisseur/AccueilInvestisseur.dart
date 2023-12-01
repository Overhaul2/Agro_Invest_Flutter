
import 'package:agro_invest/pages/Investisseur/AccueilleInvestContent.dart';
import 'package:agro_invest/pages/SideBarre/Aide.dart';
import 'package:agro_invest/pages/SideBarre/NoterApplication.dart';
import 'package:agro_invest/pages/SideBarre/PartagerApplication.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/InvestisseurProvider.dart';
import '../Agriculteur/OffreAProximite.dart';
import '../Agriculteur/SideBar.dart';
import '../SideBarre/Appropos.dart';
import '../SideBarre/ContacterSupport.dart';
import '../SideBarre/Parametre.dart';

class AccueilInves extends StatefulWidget {
  const AccueilInves({Key? key}) : super(key: key);

  @override
  State<AccueilInves> createState() => _AccueilState();
}

class _AccueilState extends State<AccueilInves> {
  var currentPage = DrawersSection.Accueil;

  @override
  Widget build(BuildContext context) {

    Widget container = AccueilleInvestContent();
    if (currentPage == DrawersSection.Accueil) {
      container = AccueilleInvestContent();
    } else if (currentPage == DrawersSection.Parametre) {
      container = ParametrePage();
    } else if (currentPage == DrawersSection.Apropos) {
      container = ApproposApplication();
    } else if (currentPage == DrawersSection.Contacter_le_Supports) {
      container = ContacterSupport();
    } else if (currentPage == DrawersSection.Aide) {
      container = Aide();
    } else if (currentPage == DrawersSection.Partager_lapplication) {
      container = PartagerApplication();
    } else if (currentPage == DrawersSection.noter) {
      container = NoterApliccation();
    } else if (currentPage == DrawersSection.Se_Deconnecter) {
      container = OffreAProximite();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<InvestisseurProvider>(
            builder: (context, investisseurProvider, _) {
              if (investisseurProvider.investisseur != null) {
                String? nomPrenom = investisseurProvider.investisseur!.nomPrenom;
                if (nomPrenom != null) {
                  return Text("investisseur $nomPrenom");
                } else {
                  return Text("Aucun Utilisateur Connecté",
                      style: TextStyle(color: Colors.black87));
                }
              } else {
                return Text("");
              }
            },
          ),
        ),
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MonHearderDrawer(),
                  MonheaderDrawerList(),
                  /* Container(
                    child: Container1,
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//carousel slider
  Widget content(BuildContext context, List<String> images) {
    return Container(
        child: CarouselSlider(
          items: images.map((imagePath) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  (imagePath),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
//        height: 00,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlayCurve: Curves.easeInCubic,
          ),
        ));
  }

//side bare widget
  Widget MonheaderDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        //liste des menu drawer
        children: [
          menuItem(1, "Accueil", Icons.house_rounded,
              currentPage == DrawersSection.Accueil ? true : false),
          menuItem(2, "Paramètre", Icons.settings,
              currentPage == DrawersSection.Parametre ? true : false),
          menuItem(3, "Apropos", Icons.info_outline,
              currentPage == DrawersSection.Apropos ? true : false),
          menuItem(4, "Contacter le Support",
              Icons.contact_support_outlined,
              currentPage == DrawersSection.Contacter_le_Supports
                  ? true
                  : false),
          menuItem(5, "Aide", Icons.add_task,
              currentPage == DrawersSection.Aide ? true : false),
          menuItem(6, "Partager l'Application",
              Icons.share,
              currentPage == DrawersSection.Partager_lapplication
                  ? true : false),
          menuItem(7, "Noter l'Application", Icons.feedback_outlined,
              currentPage == DrawersSection.noter ? true : false),
          menuItem(8, "Se Deconnecter", Icons.logout,
              currentPage == DrawersSection.Se_Deconnecter ? true : false),
        ],
      ),
    );
  }

  //affectation des pages de la liste enum dans le side
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Color(0xA8008000) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawersSection.Accueil;
            } else if (id == 2) {
              currentPage = DrawersSection.Parametre;
            } else if (id == 3) {
              currentPage = DrawersSection.Apropos;
            } else if (id == 4) {
              currentPage = DrawersSection.Contacter_le_Supports;
            } else if (id == 5) {
              currentPage = DrawersSection.Aide;
            } else if (id == 6) {
              currentPage = DrawersSection.Partager_lapplication;
            } else if (id == 7) {
              currentPage = DrawersSection.noter;
            } else if (id == 8) {
              currentPage = DrawersSection.Se_Deconnecter;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(13.0),
          child: Row(
            children: [
              //taille de l'icone side
              Expanded(
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.black87,
                  )),
              //taille du texte side
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//side Barre enum liste
enum DrawersSection {
  Accueil,
  Parametre,
  Apropos,
  Contacter_le_Supports,
  Aide,
  Partager_lapplication,
  noter,
  Se_Deconnecter,
}
