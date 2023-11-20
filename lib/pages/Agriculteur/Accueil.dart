import 'package:agro_invest/pages/Formations/Formations.dart';
import 'package:agro_invest/pages/Forum.dart';
import 'package:agro_invest/pages/MesDemandes.dart';
import 'package:agro_invest/pages/Messages.dart';
import 'package:agro_invest/pages/OffreAProximite.dart';
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
  var currentPage = DrawersSection.Accueil;
  @override
  Widget build(BuildContext context) {
    //images dans le carousel
    List<String> imagePath = [
      "asset/images/sliders/slider1.png",
      "asset/images/sliders/slider2.png",
      "asset/images/sliders/slider3.png",
      "asset/images/sliders/slider4.png",
      "asset/images/sliders/slider5.png",
      "asset/images/sliders/slider6.png",
      "asset/images/sliders/slider7.png",
      "asset/images/sliders/slider8.png",
      "asset/images/sliders/slider9.png",
      "asset/images/sliders/slider11.png",
      "asset/images/sliders/slider12.png",
      "asset/images/sliders/slider13.png",
      "asset/images/sliders/slider14.png",
      "asset/images/sliders/slider15.png",
      "asset/images/sliders/slider16.png",
      "asset/images/sliders/slider17.png",
    ];
    var Container1;
    if (currentPage == DrawersSection.Accueil) {
      Container1 = Accueil();
    } else if (currentPage == DrawersSection.Parametre) {
      Container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Apropos) {
      Container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Contacter_le_Supports) {
      Container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Aide) {
      Container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Partager_lapplication) {
      Container1 = PartagerApplication();
    } else if (currentPage == DrawersSection.noter) {
      Container1 = ParametrePage();
    } else if (currentPage == DrawersSection.Se_Deconnecter) {
      Container1 = ParametrePage();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Accueil")),
        ),
        body: Column(
          children: [
            Container(
              child: content(context, imagePath),
            ),
            //les cards  sur la page d'accueil
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                ),
                scrollDirection: Axis.vertical,
                children: [
                Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MesDemndes()));
                  },
                  child: Container(
               //     color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset("asset/images/demande.jpg",height: 125,),
                          FittedBox(
                            child: Text(
                              "Mes Demandes",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        //IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.green,),)
                      ],
                    ),
                  ),
                ),
              ),

                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Formations()));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Container(
                    //      color: Colors.grey,
                          child: Column(
                            children: [
                              Image.asset("asset/images/formations2.jpg",height: 125,),
                              FittedBox(
                                child: Text(
                                  "Formations",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OffreAProximite()));
                    },
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Container(
                          //color: Colors.grey,
                          child: Column(
                            children: [
                              Image.asset("asset/images/proximite2.jpg",height: 125,),
                              FittedBox(
                                child: Text(
                                  "Offre à proximité",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Forums()));
                    },
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Container(
                         // color: Colors.grey,
                          child: Column(
                            children: [
                              Image.asset("asset/images/forums2.jpg",height: 125,),
                              FittedBox(
                                child: Text(
                                  "Forums de Discutions",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Messages()));
                    },
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10,
                        child: Container(
                        //  color: Colors.grey,
                          child: Column(
                            children: [
                              Image.asset("asset/images/message23.jpg",height: 125,),
                              FittedBox(
                                child: Text(
                                  "Messages",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
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
          menuItem(4,"Contacter le Support",
              Icons.contact_support_outlined,
              currentPage == DrawersSection.Contacter_le_Supports ? true : false),
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
