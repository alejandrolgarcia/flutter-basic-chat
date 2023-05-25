
import 'package:basic_chat/config/helpers/get_yesno_answer.dart';
import 'package:flutter/material.dart';
import 'package:basic_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async{
    if (text.isEmpty) return;
    

    final newMessage = Message(text: text, owner: Owner.me);
    messageList.add(newMessage);

    if(text.endsWith('?')) {
      herReply();
    }

    notifyListeners();  // notifica al provider que hay un cambio
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }

}