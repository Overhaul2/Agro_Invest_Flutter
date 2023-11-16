import 'package:agro_invest/pages/SideBar.dart';
import 'package:agro_invest/pages/SideBarre/Parametre.dart';
import 'package:agro_invest/pages/SideBarre/PartagerApplication.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  var currentPage = DrawersSection.Parametre;
  @override
  Widget build(BuildContext context) {
    //images dans le carousel
    List<String> imagePath = [
      "asset/images/slider1.png",
      "asset/images/slider2.png",
      "asset/images/slider1.png",
      "asset/images/slider2.png",
      "asset/images/slider1.png",
      "asset/images/slider2.png",
      "asset/images/slider1.png",
    ];
    var container1;
    if (currentPage == DrawersSection.Accueil) {
      container1 = Accueil();
    } else if (currentPage == DrawersSection.Parametre) {
      container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Apropos) {
      container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Contacter_le_Supports) {
      container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Aide) {
      container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Partager_lapplication) {
      container1 = PartagerApplication();
    } else if (currentPage == DrawersSection.noter) {
      container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Se_Deconnecter) {
      container1 = ParametrePage();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Accueil")),
          backgroundColor: Color(0xA8008000),
        ),
        body: Column(
          children: [
            Container(
              child: content(context, imagePath),
            ),
            //SizedBox(height: 5,),
            //les cards  sur la page d'accueil
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset("asset/images/image3.jpg"),
                            FittedBox(
                              child: Text(
                                "Mes Demandes",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset("asset/images/image3.jpg"),
                            FittedBox(
                              child: Text(
                                "Formations",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset("asset/images/image3.jpg"),
                            FittedBox(
                              child: Text(
                                "Offre à proximité",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset("asset/images/image3.jpg"),
                            FittedBox(
                              child: Text(
                                "Forums de Discutions",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.asset("asset/images/image3.jpg"),
                            FittedBox(
                              child: Text(
                                "Messages",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MonHearderDrawer(),
                  MonheaderDrawerList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*itemDashbord(String title, String image) => Container(
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                (image),
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ); */

//carousel slider
  Widget content(BuildContext context, List<String> images) {
    return Container(
        child: CarouselSlider(
      items: images.map((imagePath) {
        return Container(
          width: MediaQuery.of(context).size.width,
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
          menuItem(
              4,
              "Contacter le Support",
              Icons.contact_support_outlined,
              currentPage == DrawersSection.Contacter_le_Supports
                  ? true
                  : false),
          menuItem(5, "Aide", Icons.add_task,
              currentPage == DrawersSection.Aide ? true : false),
          menuItem(
              6,
              "Partager l'Application",
              Icons.settings,
              currentPage == DrawersSection.Partager_lapplication
                  ? true
                  : false),
          menuItem(7, "Noter l'Application", Icons.feedback_outlined,
              currentPage == DrawersSection ? true : false),
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
              currentPage = DrawersSection.Accueil;
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
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 40,
                color: Colors.black87,
              )),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
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
