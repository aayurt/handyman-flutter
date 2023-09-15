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
    Item("Can we change the booking dates ?",
        "The booking dates cannot be changed."),
    Item("Can we change the timeslot for bookings ?",
        "The timeslots can be changed, however it can be done only before the cotractor accepts the job. Once the status is accepted, the time cannot be changed"),
    Item("Can I chat to the contractor ?",
        "Yes, customers can contact contractors. Only then a contractor can reply."),
    Item("How do I use the map search",
        "The map search can be viewed by switiching between list search and map search. The markers will be shown according to the searched text."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                    tileColor: Theme.of(context).colorScheme.primary,
                    title: Text(
                      item.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                body: ListTile(
                    tileColor: Theme.of(context).colorScheme.primary,
                    title: Text(item.answer),
                    onTap: () {
                      // setState(() {
                      //   items.removeWhere(
                      //       (Item currentItem) => item == currentItem);
                      // });
                    }),
                isExpanded: item.isExpanded,
                backgroundColor: Theme.of(context).colorScheme.primary,
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
