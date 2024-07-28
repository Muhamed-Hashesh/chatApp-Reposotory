import 'package:chat_application/helper/snackbar.dart';
import 'package:chat_application/models/bubble_model.dart';
import 'package:chat_application/widgets/bubble_chat.dart';
import 'package:chat_application/widgets/chat_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  final TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      child: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: messages
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Expanded(
                        child: Center(
                          child: Text('Something went wrong'),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'No messages found\nwrite your first message..',
                          ),
                        ),
                      );
                    } else {
                      List<MessageBubbleModel> messagesList = [];
                      // for (var message in snapshot.data!.docs) {
                      //   messagesList.add(MessageBubbleModel.fromJson(message));
                      // }
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        messagesList.add(MessageBubbleModel.fromJson(
                            snapshot.data!.docs[i]));
                      }
                      // print(snapshot.data!.docs[0]['message']);
                      return ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return messagesList[index].uid ==
                                  FirebaseAuth.instance.currentUser!.uid
                              ? FriendChatBubble(messageObject: messagesList[index])
                              : ChatBubble(
                                  messageObject: messagesList[index],
                                );
                        },
                      );
                    }
                  }),
            ),
          ),
          ChatInputField(
            controller: controller,
            onTap: (value) {
              messages.add({
                'message': value,
                'createdAt': DateTime.now(),
                'uid': FirebaseAuth.instance.currentUser!.uid,
              });
              controller.clear();
              _controller.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
        ],
      ),
    ));
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 110,
      color: Colors.transparent,
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Chatnella',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            // Handle back button action here
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              customScaffold(context,
                  text: 'Logged out successfully', color: Colors.green);
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/LoginPage',
                (route) => false,
              );
            },
            icon: const Icon(
              Iconsax.logout5,
              color: Colors.red,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
