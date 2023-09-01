import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
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
  String userType = "";
  List<ChatModel> messages = [];
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ChatBloc>().add(const ChatEvent.get());

      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
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
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatStateLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ChatStateLoaded) {
                  List<ChatModel> chats = state.chats;
                  List<ChatModel> filteredChats = chats.where((chat) {
                    if (userType == "Contractor") {
                      return chat.customer!.id == widget.id;
                    } else {
                      return chat.contractor!.id == widget.id;
                    }
                  }).toList();
                  print(chats);
                  print(filteredChats);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredChats.length,
                      itemBuilder: (context, index) {
                        final chat = filteredChats[index];
                        return CustomCardWidget(
                            children:
                                Text("${chat.contractor!.name}: ${chat.msg},"));
                      },
                    ),
                  );
                } else {
                  return const Text("Error");
                }
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
                  onPressed: () async {
                    // Implement the send message functionality here
                    try {
                      final ApiService request = ApiService();
                      final response = await request.post(
                        ApiEndpoint(AppConstants.baseUrl, ApiList.chat, {}),
                        data: ({
                          "clientId": widget.id,
                          "msg": textController.text
                        }),
                      );
                      if (response.data) {
                        textController.clear();
                      }
                    } on Exception {
                      rethrow;
                    }
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
