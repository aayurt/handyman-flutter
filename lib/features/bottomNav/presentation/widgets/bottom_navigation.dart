import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:handyman/theme/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Widget child;

  const CustomBottomNavigationBar({super.key, required this.child});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarItem {
  final GButton item;
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

  Color getOppositeBackgroundColor(BuildContext context) {
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    return isDarkTheme
        ? lightThemeColors(context).background
        : darkThemeColors(context).background;
  }

  @override
  Widget build(BuildContext context) {
    var currentRoute = GoRouterState.of(context).matchedLocation;

    var destinationList = [
      CustomBottomNavigationBarItem(
          item: const GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          location: RoutesConstant.dashboard),

      userType == "Customer"
          ? CustomBottomNavigationBarItem(
              item: const GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              location: RoutesConstant.search)
          : CustomBottomNavigationBarItem(
              item: const GButton(
                icon: Icons.analytics_outlined,
                text: 'Listings',
              ),
              location: RoutesConstant.jobs),
      userType == "Contractor"
          ? CustomBottomNavigationBarItem(
              item: const GButton(
                icon: Icons.list_alt,
                text: 'Orders',
              ),
              location: RoutesConstant.orders)
          : CustomBottomNavigationBarItem(
              item: const GButton(
                icon: Icons.list_alt,
                text: 'My Orders',
              ),
              location: RoutesConstant.orders),
      // CustomBottomNavigationBarItem(
      //     item: const GButton(
      //       icon: Icons.shopping_basket_outlined,
      //       text: 'Cart',
      //     ),
      //     location: RoutesConstant.cart),
      CustomBottomNavigationBarItem(
          item: const GButton(
            icon: Icons.chat,
            text: 'Chat',
          ),
          location: RoutesConstant.chatList),
      CustomBottomNavigationBarItem(
          item: const GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          location: RoutesConstant.profile)
    ];

    if (userType == "Contractor") {
      destinationList.removeWhere(
          (element) => element.location == RoutesConstant.dashboard);
    }
    var currentIndex = destinationList
        .indexWhere((element) => element.location == currentRoute);

    final destList = destinationList.map((e) => e.item).toList();
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          haptic: true,
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(
              color: getOppositeBackgroundColor(context),
              width: 1), // tab button border
          iconSize: 24,
          padding: const EdgeInsets.all(10),
          gap: 8,
          tabs: destList,
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              context.go(destinationList[index].location);
            });
          },
        ),
      ),
    );
  }
}
