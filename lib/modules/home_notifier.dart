import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/index.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier(this.context){
    getData();
  }

  List<String> chats = [];

  TextEditingController message = TextEditingController();

  void sendMessage() {
    if (message.text.isNotEmpty) {
      chats.add(message.text.trim());
      message.clear();
      notifyListeners();
    }
  }

  List<ChatModel> listChat = [];

  getData() async {
    Dio dio = Dio();
    final response = await dio.get('https://tegaldev.metimes.id/chat-sample');
    final results = jsonDecode(response.data);
    for (Map<String, dynamic> result in results['data']) {
      listChat.add(ChatModel.fromJson(result));
    }
    notifyListeners();
    print(listChat.length);
  }
}