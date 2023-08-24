import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/routes/routes_constant.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Widget child;

  const CustomBottomNavigationBar({super.key, required this.child});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarItem {
  final BottomNavigationBarItem item;
  final String location;

  const CustomBottomNavigationBarItem({
    required this.item,
    required this.location,
  });
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  String userType = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentRoute = GoRouterState.of(context).matchedLocation;

    final destinationList = [
      CustomBottomNavigationBarItem(
          item: const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          location: RoutesConstant.dashboard),
      userType == "Contractor"
          ? CustomBottomNavigationBarItem(
              item: const BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Listings',
              ),
              location: RoutesConstant.jobs)
          : CustomBottomNavigationBarItem(
              item: const BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Orders',
              ),
              location: RoutesConstant.orders),
      userType == "Contractor"
          ? CustomBottomNavigationBarItem(
              item: const BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Orders',
              ),
              location: RoutesConstant.orders)
          : CustomBottomNavigationBarItem(
              item: const BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'My Orders',
              ),
              location: RoutesConstant.orders),
      // CustomBottomNavigationBarItem(
      //     item: const BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_basket_outlined),
      //       label: 'Cart',
      //     ),
      //     location: RoutesConstant.cart),
      CustomBottomNavigationBarItem(
          item: const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          location: RoutesConstant.profile)
    ];
    var currentIndex = destinationList
        .indexWhere((element) => element.location == currentRoute);
    final destList = destinationList.map((e) => e.item).toList();
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: destList,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          context.go(destinationList[index].location);
        },
      ),
    );
  }
}
