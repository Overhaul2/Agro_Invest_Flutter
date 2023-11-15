import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 19, 108, 22),
      //   elevation: 0,
      // ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    
                      child:
                          Image.asset("asset/images/Vector1-removebg-preview.png")),
                ),

               
                //   Container(
                //   height: 180, // Hauteur fixe pour le ClipPath
                //   child: Stack(
                //     children: [
                //       Opacity(
                //         opacity: 1,
                //         child: ClipPath(
                //           clipper: WaveClipper(),
                //           child: Container(
                //             color: Color.fromARGB(255, 22, 139, 26),
                //             height: 100,
                //           ),
                //         ),
                //       ),
                //       ClipPath(
                //         clipper: WaveClipper(),
                //         child: Container(
                //           color: Color.fromARGB(255, 19, 108, 22),
                //           height: 80,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Nom et Prenom",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 108, 22),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 19, 108, 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 108, 22),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 19, 108, 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Numéro Téléphone",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 108, 22),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 19, 108, 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Mot de passe",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 108, 22),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 19, 108, 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            labelText: "Confirmer le Mot de passe",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 108, 22),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 19, 108, 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsqu'on appuie sur le bouton
                },
                child: Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 19, 108, 22),
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20), // Ajustez les valeurs ici
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
                      ]
            ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Parametre du clipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height / 5);
    var firstStart = Offset(size.height / 5, size.height);

    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
    Offset(size.width - (size.height / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
