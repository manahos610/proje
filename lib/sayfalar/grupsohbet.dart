import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Grupsohbet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  String _userName = '';

  void _sendMessage(String message) {
    final trimmedUserName = _userName.trim(); // Boşlukları kaldır
    if (trimmedUserName.isNotEmpty && message.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': message,
        'userName': trimmedUserName, // Kullanıcının adını Firestore'a kaydet
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hata'),
            content:
                const Text('Lütfen önce bir kullanıcı adı ve mesaj girin.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bağış Hakkında Sohbet'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;
                List<Widget> messageWidgets = [];
                for (var message in messages) {
                  final messageText = message['text'];
                  final userName = message['userName']; // Kullanıcı adını al
                  final messageWidget = ListTile(
                    title: Text(userName),
                    subtitle: Text(messageText),
                  );
                  messageWidgets.add(messageWidget);
                }
                return ListView(
                  children: messageWidgets,
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
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Mesajınızı yazın...',
                    ),
                  ),
                ),
                IconButton(
                  constraints: BoxConstraints(maxHeight: 36),
                  icon: Icon(Icons.send),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    final message = _messageController.text;
                    if (message.trim().length >= 5) {
                      _sendMessage(message);
                    } else {
                      // Minimum 5 karakterli mesaj gereksinimi sağlanmadı
                      // Kullanıcıya bir hata mesajı gösterilebilir
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Hata'),
                            content: Text(
                                'Lütfen en az 5 karakterli bir mesaj girin.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tamam'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _userName = value; // Kullanıcı adını güncelle
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Kullanıcı adınızı girin...',
                    ),
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
