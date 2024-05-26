import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeNotifier(context),
        child: Consumer<HomeNotifier>(
            builder: (context, value, child) => Scaffold(
                  body: SizedBox(
                    width: MediaQuery.of(context).size.width > 600
                        ? 600
                        : MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/pattern.png',
                              repeat: ImageRepeat.repeat,
                              opacity: const AlwaysStoppedAnimation(0.5),
                            )),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 80,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: Image.asset(
                                        'assets/profile.jpg',
                                        width: 50,
                                        height: 50,
                                        opacity:
                                            const AlwaysStoppedAnimation(1),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Ardyy',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.video_call),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.phone),
                                    SizedBox(width: 10),
                                    Icon(Icons.more_vert),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 0,
                          right: 0,
                          bottom: 60,
                          child: ListView.builder(
                            itemCount: value.listChat.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final data = value.listChat[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: data.posisi == 'kanan'
                                      ? Colors.blue
                                      : Colors.green,
                                ),
                                margin: EdgeInsets.only(
                                  bottom: 8,
                                  left: data.posisi == 'kanan' ? 80 : 16,
                                  right: data.posisi == 'kiri' ? 80 : 16,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      data.chat,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      data.createdDate,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        // Positioned(
                        //   top: 50,
                        //   bottom: 0,
                        //   left: 0,
                        //   right: 0,
                        //   child: ListView(
                        //     children: value.chats
                        //         .map((chat) => Container(
                        //               margin: const EdgeInsets.only(
                        //                 bottom: 8,
                        //                 left: 80,
                        //                 right: 16,
                        //               ),
                        //               padding: const EdgeInsets.all(10),
                        //               decoration: BoxDecoration(
                        //                   color: Colors.blue,
                        //                   borderRadius:
                        //                       BorderRadius.circular(20)),
                        //               child: Text(chat),
                        //             ))
                        //         .toList(),
                        //   ),
                        // ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: value.message,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey,
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.send),
                                        onPressed: () {
                                          value.sendMessage();
                                        },
                                      ),
                                      hintText: 'Insert Your message ya',
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(19))),
                                )),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.mic,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
