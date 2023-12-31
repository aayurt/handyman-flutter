import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (() {
            context.go(RoutesConstant.chatList);
          }),
        ),
        title: const Text('Chat'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 10,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatStateLoading) {
                    return const Center(
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()));
                  } else if (state is ChatStateLoaded) {
                    List<ChatModel> chats = state.chats;
                    List<ChatModel> filteredChats = chats.where((chat) {
                      if (userType != "Contractor") {
                        return chat.contractor!.id == widget.id;
                      } else {
                        return chat.customer!.id == widget.id;
                      }
                    }).toList();
                    return ListView.builder(
                      itemCount: filteredChats.length,
                      itemBuilder: (context, index) {
                        String username = "";
                        String avatar = "";

                        final chat = filteredChats[index];
                        var custId = chat.customer!.id;
                        var contrId = chat.contractor!.id;
                        var senderId = chat.senderId;

                        if (userType == "Contractor" && contrId == senderId) {
                          username = chat.contractor!.name ?? "";
                          avatar = chat.contractor!.avatar ?? "";
                        } else if (userType == "Customer" &&
                            custId == senderId) {
                          username = chat.customer!.name ?? "";
                          avatar = chat.customer!.avatar ?? "";
                        } else if (userType == "Customer" &&
                            custId != senderId) {
                          username = chat.contractor!.name ?? "";
                          avatar = chat.contractor!.avatar ?? "";
                        } else {
                          username = chat.customer!.name ?? "";
                          avatar = chat.customer!.avatar ?? "";
                        }

                        return Row(
                          mainAxisAlignment: (userType == "Contractor" &&
                                      contrId == senderId) ||
                                  (userType == "Customer" && custId == senderId)
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.3)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
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
