import 'package:flutter/material.dart';
import 'package:speedy/Controller/Chat/ChatController.dart';
import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Model/chat/Message.dart';
import 'package:speedy/Repository/Chat/ChatRepositoryImpl.dart';

import '../../Model/Client.dart';
import '../../color/color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = ChatController(ChatRepositoryImpl());
  final idClient = 3;
  final topController = ScrollController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff5b61b9), //Color(0xff5b61b9)
      body: ListView(
        children: [customAppBar(context), header(), chatArea(context)],
      ),
    );
  }

  Widget chatArea(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 255,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Message>>(
                future: chatController.findAllMessageByClient(
                    idClient), //id clent wil be changed and should get on session storage
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primary,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Uner erreur est survenue"),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          final message = snapshot.data?[index];
                          return receiver(message!.statut!, message.content!,
                              message.localDate!);
                        }),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 0.2,
                            height: 0.3,
                          );
                        },
                        itemCount: snapshot.data?.length ?? 0);
                  }
                  return Text("******Application Failed *******");
                }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Ecrivez votre message...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RawMaterialButton(
                      constraints: BoxConstraints(minWidth: 0),
                      onPressed: () async {
                        Client client =
                            Client(idClient, "", "", "", "", "", true);
                        Message message = Message(1, messageController.text,
                            false, "localDate", client);

                        ServerResponse serverResponse =
                            await chatController.sendMessage(message);

                        if (serverResponse.success!) {
                          print("Message envoyé");
                          messageController.text = '';
                          setState(() {});
                        } else {
                          SnackBar snackbar = SnackBar(
                            content: Text("Echec de l'envoie du message ...",
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: warning,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      },
                      elevation: 2.0,
                      fillColor: primary,
                      child: Icon(Icons.send, size: 22.0, color: Colors.white),
                      padding: EdgeInsets.all(10.0),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Padding header() {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Speedy\nPrint',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white38,
                child: Icon(Icons.call, size: 24.0, color: Colors.white),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              SizedBox(width: 10),
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white38,
                child: Icon(Icons.video_call, size: 24.0, color: Colors.white),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white54),
              ),
              onPressed: () => {Navigator.pop(context)}),
          TextButton(
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white54),
              ),
              onPressed: null),
        ],
      ),
    );
  }

  Widget receiver(bool statut, String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment:
            statut ? MainAxisAlignment.start : MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/profil.jpg',
                width: 50,
                height: 50,
              ),
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: statut ? Color(0xff5b61b9) : Colors.blueGrey[50],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: statut ? Colors.white : Colors.black54),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          time,
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
