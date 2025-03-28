import 'package:bubble/bubble.dart';
import 'package:chatbot/models/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
      trailing: CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
      title: Bubble(
        stick: true,
        margin: BubbleEdges.only(top: 15),
        alignment: Alignment.topRight,
        nipWidth: 8,
        nipHeight: 10,
        nip: BubbleNip.rightTop,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            chatMessage.name,
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(chatMessage.text, textAlign: TextAlign.right),
          Text(chatMessage.vHora.toString(), style: TextStyle(fontSize: 10, color: Colors.grey))
        ]),
      ),
    );
  }

  Widget _showReceivedMessage() {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
      leading: CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
      title: Bubble(
        stick: true,
        margin: BubbleEdges.only(top: 15),
        alignment: Alignment.topLeft,
        nipWidth: 8,
        nipHeight: 10,
        nip: BubbleNip.leftTop,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            chatMessage.name,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(chatMessage.text, textAlign: TextAlign.left),
          Text(chatMessage.vHora.toString(), style: TextStyle(fontSize: 10, color: Colors.grey))
        ]),
      ),
    );
  }
}
