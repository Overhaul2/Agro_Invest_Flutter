import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 108, 22),
        elevation: 0,
      ),*/
      body:  SingleChildScrollView(
        child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: const Color.fromARGB(255, 22, 139, 26),
                      height: 100,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: const Color.fromARGB(255, 19, 108, 22),
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            margin:const  EdgeInsets.only(bottom: 80),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/logo.png"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 150, left: 40, right: 40),
            child:const Text("Relier les agriculteurs locaux à des investisseurs pour soutenir l'achat de semences, d'engrais et d'équipements agricoles.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, ),
            ),
          ),

        ],
      ),
      )
    );
  }
}




//parametre du clipper
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height/ 5,);
    var firstStart = Offset(size.height/5, size.height);

    var firstEnd = Offset(size.width/2.25, size.height -50.0 );

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.height/3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}

