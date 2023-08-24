import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/routes/routes_constant.dart';

class SearchJob extends StatelessWidget {
  const SearchJob({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Rounded border radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes the shadow position
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search job...',
                    border: InputBorder.none,

                    // icon: Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Handle search button press
                  if (searchController.text.isNotEmpty) {
                    context
                        .go("${RoutesConstant.jobs}/${searchController.text}");
                  }
                },
                icon: const Icon(Icons.search),
              ),
            ],
          )),
    );
  }
}
