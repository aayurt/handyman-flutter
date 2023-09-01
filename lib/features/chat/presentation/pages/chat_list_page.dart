import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
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
        title: const Text('Chats'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // final message = messages[index];
                return const Text("message: message,");
              },
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
