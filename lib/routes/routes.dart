import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/bottomNav/presentation/widgets/bottom_navigation.dart';
import 'package:handyman/features/cart/presentation/pages/cart_page.dart';
import 'package:handyman/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:handyman/features/job/presentation/pages/job_page.dart';
import 'package:handyman/features/job/presentation/pages/search_page.dart';
import 'package:handyman/features/login/presentation/pages/login_page.dart';
import 'package:handyman/features/order/presentation/pages/order_job_update_page.dart';
import 'package:handyman/features/order/presentation/pages/order_page.dart';
import 'package:handyman/features/profile/presentation/pages/profile_page.dart';
import 'package:handyman/features/register/presentation/pages/register_page.dart';
import 'package:handyman/features/splash/presentation/pages/splash_page.dart';

import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/job/presentation/pages/filter_job_page.dart';
import '../features/job/presentation/pages/job_add.dart';
import '../features/job/presentation/pages/order_job_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routes {
  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Uri.base.toString().replaceFirst(Uri.base.origin, ''),
      redirect: (BuildContext context, GoRouterState state) async {
        final getToken = await SharedPrefService.getToken(SharedPrefKey.token);
        if (((state.fullPath == RoutesConstant.login) ||
            (state.fullPath == RoutesConstant.register))) {
          if (getToken.isNotEmpty) {
            return RoutesConstant.dashboard;
          }
          return null;
        } else if (getToken.isEmpty) {
          return RoutesConstant.login;
        } else {
          return null;
        }
      },
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstant.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: RoutesConstant.login,
          builder: (context, state) => const LoginPage(),
        ),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return CustomBottomNavigationBar(child: child);
            },
            routes: [
              GoRoute(
                path: RoutesConstant.dashboard,
                builder: (context, state) => const DashboardPage(),
              ),
              GoRoute(
                path: RoutesConstant.profile,
                builder: (context, state) => const ProfilePage(),
              ),
              GoRoute(
                path: RoutesConstant.orders,
                builder: (context, state) => const OrderListPage(),
              ),
              GoRoute(
                path: RoutesConstant.cart,
                builder: (context, state) => const CartPage(),
              ),
              GoRoute(
                path: RoutesConstant.jobs,
                builder: (context, state) => const JobListPage(),
              ),
              GoRoute(
                path: RoutesConstant.search,
                builder: (context, state) => const SearchJobPage(
                  search: '',
                ),
              ),
            ]),
        GoRoute(
          path: "${RoutesConstant.jobs}/:search",
          builder: (context, state) =>
              FilterJobPage(search: state.pathParameters['search'] ?? ""),
        ),
        GoRoute(
          path: RoutesConstant.register,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: "${RoutesConstant.job}/add",
          builder: (context, state) => const JobAddPage(),
        ),
        GoRoute(
          path: "${RoutesConstant.job}/:id",
          builder: (context, state) =>
              JobAddPage(id: state.pathParameters['id'] ?? ""),
        ),
        GoRoute(
          path: "${RoutesConstant.jobOrder}/:id",
          builder: (context, state) =>
              OrderJobUpdatePage(id: state.pathParameters['id'] ?? ""),
        ),
        GoRoute(
          path: "${RoutesConstant.orders}/:id",
          builder: (context, state) =>
              OrderJobPage(id: state.pathParameters['id'] ?? ""),
        ),
      ]);
}

// _customAnimation(context, state, child) {
//   return CustomTransitionPage(
//     key: state.pageKey,
//     child: child,
//     transitionDuration: const Duration(milliseconds: 0),
//     transitionsBuilder: (BuildContext context, Animation<double> animation,
//         Animation<double> secondaryAnimation, Widget child) {
//       // Change the opacity of the screen using a Curve based on the the animation's
//       // value
//       return FadeTransition(
//         opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//         child: child,
//       );
//     },
//   );
// }
