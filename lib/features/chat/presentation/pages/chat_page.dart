import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (() {
            context.go(RoutesConstant.chatList);
          }),
        ),
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
                  String id = "";
                  String username = "";
                  String avatar = "";
                  List<ChatModel> filteredChats = chats.where((chat) {
                    if (userType != "Contractor") {
                      username = chat.contractor!.name ?? "";
                      avatar = chat.contractor!.avatar ?? "";
                      id = chat.contractor!.id ?? "";
                      return chat.contractor!.id == widget.id;
                    } else {
                      username = chat.customer!.name ?? "";
                      id = chat.customer!.id ?? "";
                      avatar = chat.customer!.avatar ?? "";
                      return chat.customer!.id == widget.id;
                    }
                  }).toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredChats.length,
                      itemBuilder: (context, index) {
                        final chat = filteredChats[index];
                        return Row(
                          mainAxisAlignment: widget.id != id
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCardWidget(
                                children: Row(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            "${AppConstants.fileUrl}$avatar",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(username),
                                        Text("${chat.msg}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
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
                    final ApiService request = ApiService();
                    final response = await request.post(
                      ApiEndpoint(AppConstants.baseUrl, ApiList.chat, {}),
                      data: ({
                        "clientId": widget.id,
                        "msg": textController.text
                      }),
                    );
                    if (response.data != null) {
                      textController.clear();
                      context.read<ChatBloc>().add(const ChatEvent.get());
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
