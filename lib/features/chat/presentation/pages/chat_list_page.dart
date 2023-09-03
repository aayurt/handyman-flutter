import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final TextEditingController textController = TextEditingController();
  String userType = "";
  String userId = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ChatBloc>().add(const ChatEvent.get());
      String usertype =
          await SharedPrefService.getToken(SharedPrefKey.userType);
      var userid = await SharedPrefService.getToken(SharedPrefKey.userId);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
          userId = userid;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Chats'),
      // ),
      body: Column(
        children: [
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChatStateLoaded) {
                List<ChatModel> chats = state.chats;
                List<ChatModel> filteredChats = chats.reversed.where((chat) {
                  if (userType == "Contractor") {
                    return chat.contractor!.id == userId;
                  } else {
                    return chat.customer!.id == userId;
                  }
                }).toList();

                Set<String> uniqueIds = <String>{};

                List<ChatModel> uniqueChats = [];

                for (var chat in filteredChats) {
                  String idToCheck;

                  if (userType == "Contractor") {
                    idToCheck = chat.customer?.id ?? '';
                  } else {
                    idToCheck = chat.contractor?.id ?? '';
                  }

                  if (!uniqueIds.contains(idToCheck)) {
                    uniqueIds.add(idToCheck);
                    uniqueChats.add(chat);
                  }
                }
                if (uniqueChats.isEmpty) {
                  return const Text("No chats.");
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: uniqueChats.length,
                    itemBuilder: (context, index) {
                      String username = "";
                      String avatar = "";
                      final chat = uniqueChats[index];

                      if (userType != "Contractor") {
                        username = chat.contractor!.name ?? "";
                        avatar = chat.contractor!.avatar ?? "";
                      } else if (userType != "Customer") {
                        username = chat.customer!.name ?? "";
                        avatar = chat.customer!.avatar ?? "";
                      } else {}
                      return InkWell(
                        onTap: () {
                          if (userType == "Contractor") {
                            context.go(
                                "${RoutesConstant.chat}/${chat.customer!.id}");
                          } else {
                            context.go(
                                "${RoutesConstant.chat}/${chat.contractor!.id}");
                          }
                        },
                        child: Padding(
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
                                    height: 50,
                                    width: 50,
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
                                      Text(
                                        username,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        chat.msg!,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Text("Error");
              }
            },
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
