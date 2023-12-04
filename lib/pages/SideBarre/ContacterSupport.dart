import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContacterSupport(),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});



}

class ContacterSupport extends StatefulWidget {
  const ContacterSupport({Key? key}) : super(key: key);

  @override
  State<ContacterSupport> createState() => _ContacterSupportState();
}

class _ContacterSupportState extends State<ContacterSupport> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  void sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content_type': 'application/json',
        'Authorization': 'Bearer $apikey',
      },
      body: jsonEncode({'prompt': message,
      'max_tokens': 50,
      }),
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        print(response.body);
        chatMessages.add(ChatMessage(text: message, isUser: true));
        chatMessages.add(ChatMessage(text: jsonResponse['choices'][0]['text'], isUser: false));
      });
    }else{
      print("erreur de requette avec le statut:${response.statusCode}");
    }


   /* // Gérer la réponse de l'API, par exemple, mise à jour de l'état pour afficher la réponse.
    final String reply = jsonDecode(response.body)['choices'][0]['text'];
    setState(() {
      chatMessages.add(ChatMessage(message: message));
      chatMessages.add(ChatMessage(message: reply));
    });*/

    // Effacer le texte du contrôleur après l'envoi du message.
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Contacter le support')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message= chatMessages[index];
                return ListTile(
                  title: Text(chatMessages[index].text),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(

                    onTapOutside: (e) =>FocusScope.of(context).unfocus(),
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Entrez votre message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(messageController.text);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
