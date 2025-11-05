import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/call_dialog.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/options_dialog.dart';
import 'package:yes_no_app/presentation/widgets/chat/profile_dialog.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            //Detecta cuando el usuario toca la imagen de perfil
            onTap: () => ProfileDialog.show(
              context,
            ), //Al tocar la imagen, se muestra la ventana con los datos del perfil del contacto
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM7DNYo6lNyNF5dLDaeuVbMqVNVBxKGaFSZA&s',
              ),
            ),
          ),
        ),
        title: GestureDetector(
          //Detecta si se toca el nombre del contacto
          onTap: () => ProfileDialog.show(
            context,
          ), //Muestra la ventana con los datos del perfil
          child: const Text('Mi coquita 🥵'),
        ),
        centerTitle: false,
        actions: [
          //Botón de llamada
          IconButton(
            onPressed: () => CallDialog.show(context),
            icon: const Icon(Icons.call),
          ),
          //Menú de opciones
          IconButton(
            onPressed: () => OptionsDialog.show(context),
            icon: const Icon(Icons.more_vert),
          ),
        ],
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
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            //Caja de texto de mensaje
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
