import 'package:basic_chat/domain/entities/message.dart';
import 'package:basic_chat/presentation/providers/chat_provider.dart';
import 'package:basic_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:basic_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:basic_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index){

                final message = chatProvider.messageList[index];

                return (message.owner == Owner.yours)
                  ? HerMessageBubble(message: message,)
                  : MyMessageBubble(message: message);

              }
            )),
            
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}