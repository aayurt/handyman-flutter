import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';

class ChatPage extends StatefulWidget {
  final String id;
  const ChatPage({Key? key, required this.id}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> messages = [];
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ChatBloc>().add(const ChatEvent.get());

      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          // userType = usertype;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with User2'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return const Text("message: message,");
              },
            ),
          ),
          // Add a text field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement the send message functionality here
                    final newMessage = ChatModel(
                      msg: textController.text,
                      // sender: user1, // Replace with the appropriate user
                      contractorId: "1",
                      customerId: "1",
                    );
                    // Add the new message to the list of messages
                    messages.add(newMessage);
                    textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class ChatBubble extends StatelessWidget {
//   final ChatModel message;

//   ChatBubble({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage(message.sender.profileImage),
//       ),
//       title: Text(message.sender.name),
//       subtitle: Text(message.text),
//     );
//   }
// }
