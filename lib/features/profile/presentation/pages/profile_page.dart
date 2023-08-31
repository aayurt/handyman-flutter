import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:handyman/features/profile/presentation/pages/profile_form_update.dart'
    if (dart.library.js) 'package:handyman/features/profile/presentation/pages/profile_form_update_web.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userType = "";

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.read<ProfileBloc>().add(const ProfileEvent.get());
        var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
        if (usertype.isNotEmpty) {
          setState(() {
            userType = usertype;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Stack(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                  height: 30,
                ),
                //
                Expanded(
                  child: Text(
                    "$userType Update",
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            Positioned(
              right: 20,
              child: TextButton(
                  onPressed: () async {
                    await SharedPrefService.storeToken(SharedPrefKey.token, "");
                    await SharedPrefService.storeToken(
                        SharedPrefKey.userType, "");
                    context.go(RoutesConstant.login);
                  },
                  child: const Text("Logout")),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileStateError) {
              context.go(RoutesConstant.login);
            }
          },
          builder: (context, state) {
            if (state is ProfileStateLoaded) {
              var userModelData = state.user;
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  child: ProfileFormUpdate(userModelData: userModelData),
                ),
              );
            } else if (state is ProfileStateLoading) {
              return const CircularProgressIndicator();
            } else {
              return const Text("Error");
            }
          },
        ),
      ])),
    );
  }
}
