import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Demandes/MesDemandes.dart';
import 'Formations/Formations.dart';
import 'Forum.dart';
import 'Messages.dart';
import 'OffreAProximite.dart';

class Accueiltest extends StatefulWidget {
  const Accueiltest({Key? key}) : super(key: key);

  @override
  State<Accueiltest> createState() => _AccueiltestState();
}

class _AccueiltestState extends State<Accueiltest> {
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

    return SafeArea(child: Scaffold(
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
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => MesDemndes()));
                    },
                    child: Container(
                      //     color: Colors.grey,
                      child: Column(
                        children: [
                          Image.asset(
                            "asset/images/demande.jpg", height: 125,),
                          FittedBox(
                            child: Text(
                              "Mes Demandes",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Formations()));
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
                            Image.asset(
                              "asset/images/formations2.jpg", height: 125,),
                            FittedBox(
                              child: Text(
                                "Formations",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OffreAProximite()));
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
                            Image.asset(
                              "asset/images/proximite2.jpg", height: 125,),
                            FittedBox(
                              child: Text(
                                "Offre à proximité",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Forums()));
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
                            Image.asset(
                              "asset/images/forums2.jpg", height: 125,),
                            FittedBox(
                              child: Text(
                                "Forums de Discutions",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Messages()));
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
                            Image.asset(
                              "asset/images/message23.jpg", height: 125,),
                            FittedBox(
                              child: Text(
                                "Messages",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
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
    ));
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
}
