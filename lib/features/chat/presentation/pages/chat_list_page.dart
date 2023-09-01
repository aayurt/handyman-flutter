import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
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
                        child: CustomCardWidget(
                            children:
                                Text("${chat.contractor!.name}: ${chat.msg},")),
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
