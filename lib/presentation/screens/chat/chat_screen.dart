import 'package:basic_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:basic_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:basic_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://realidadessperiodico.com/wp-content/uploads/2020/06/avtars.jpg'),
          ),
        ),

        title: const Text('Chinita 💚'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                return (index %2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
              }
            )),
            
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}