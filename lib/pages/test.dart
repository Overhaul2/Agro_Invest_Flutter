import 'package:flutter/material.dart';

class Testt extends StatefulWidget {
  const Testt({super.key});

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            Container(
              height: 200,
              child: Image.asset("asset/images/blob.png")),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/images/image6.jpg"),
                   const  TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        labelText: "Nom et Prenom",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 19, 108, 22),
                            width: 2.0,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 19, 108, 22),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 19, 108, 22),
                            width: 2.0,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 19, 108, 22),
                        ),
                      ),
                    ),
                   const SizedBox(height: 20),
                   const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        labelText: "Numéro Téléphone",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 19, 108, 22),
                            width: 2.0,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 19, 108, 22),
                        ),
                      ),
                    ),
                   const SizedBox(height: 20),
                  const  TextField(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 19, 108, 22),
                        ),
                      ),
                    ),
                  const  SizedBox(height: 20),
                   const TextField(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 120,
                            vertical: 20), // Ajustez les valeurs ici
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      
                    ),
                    // SizedBox(height: 100,)
                  ]
                  
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
