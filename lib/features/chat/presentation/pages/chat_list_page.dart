import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
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

      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
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
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: Column(
        children: [
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatStateLoading) {
                return const CircularProgressIndicator();
              } else if (state is ChatStateLoaded) {
                List<ChatModel> chats = state.chats;
                List<ChatModel> filteredChats = chats.reversed.where((chat) {
                  if (userType == "Contractor") {
                    return chat.contractor!.id == userId;
                  } else {
                    return chat.customer!.id == userId;
                  }
                }).toList();

// Create a Set to store unique ChatModel objects
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

                return Expanded(
                  child: ListView.builder(
                    itemCount: uniqueChats.length,
                    itemBuilder: (context, index) {
                      String id = "";
                      String username = "";
                      String avatar = "";
                      final chat = uniqueChats[index];

                      if (userType != "Contractor") {
                        username = chat.contractor!.name ?? "";
                        avatar = chat.contractor!.avatar ?? "";
                        id = chat.contractor!.id ?? "";
                      } else {
                        username = chat.customer!.name ?? "";
                        id = chat.customer!.id ?? "";
                        avatar = chat.customer!.avatar ?? "";
                      }
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
                              Text("$username: ${chat.msg},"),
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
