import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/routes/routes_constant.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Item> items = [
    Item("question 1", "answer 1"),
    Item("question 2", "answer 2"),
    Item("question 3", "answer 3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {context.go(RoutesConstant.profile)},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: const EdgeInsets.all(0),
            animationDuration: const Duration(milliseconds: 300),
            children: items.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.question + item.isExpanded.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                body: ListTile(
                    title: Text(item.answer),
                    onTap: () {
                      // setState(() {
                      //   items.removeWhere(
                      //       (Item currentItem) => item == currentItem);
                      // });
                    }),
                isExpanded: item.isExpanded,
              );
            }).toList(),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  Item(this.question, this.answer, {this.isExpanded = false});

  String question;
  String answer;
  bool isExpanded;
}
