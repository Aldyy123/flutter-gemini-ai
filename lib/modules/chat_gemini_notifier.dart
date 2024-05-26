import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatGeminiNotifier extends ChangeNotifier {
  final BuildContext context;

  ChatGeminiNotifier(this.context);

  final Gemini gemini = Gemini.instance;

  List<ChatMessage> listMessage = [];

  ChatUser currentUser = ChatUser(
    id: '1',
    firstName: 'Ardyy',
  );

  ChatUser geminiUser = ChatUser(id: '2', firstName: 'Gemini');

  sendMessage(ChatMessage message) {
    listMessage = [...listMessage, message];
    try {
      String values = message.text;
      gemini.streamGenerateContent(values).listen((event) {
        String response = event.content!.parts
                ?.fold("", (before, after) => "$before ${after.text}") ??
            '';
        ChatMessage resultMessage = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response ?? 'Sorry, I don\'t understand',
        );
        listMessage = [resultMessage, ...listMessage];
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
