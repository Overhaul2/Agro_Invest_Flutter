import 'package:http/http.dart' as http;


class InvestisseurService {


  Future<bool> loginAgriculteur(String email, String password) async {
    //const apiUrl = "http://localhost:8080/agriculteur/connexion";
    const apiUrl = "http://10.0.2.2:8080/agriculteur/connexion";

    final response = await http.get(
        Uri.parse("$apiUrl?email=$email&password=$password"));

    if (response.statusCode == 200) {
      // Connexion réussie
      if (response.body == "Agriculteur connecter avec succès") {
        return true;
      }
      print('Connexion réussie');
      //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Accueil()));
      return false;
    } else {
      print(response.body);
      // Identifiants invalides
      print('Email ou mot de passe incorrect');
      // Afficher un message d'erreur
      //ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(content: Text("Adresse Email ou mot de passe incorrect")));
      return false;
    }
  }
}