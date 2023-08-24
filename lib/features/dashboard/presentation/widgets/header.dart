import 'package:flutter/material.dart';
import '../../../../core/mediaquery.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: kWidth(context),
        height: kHeight(context) * 0.5,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/header.png"), fit: BoxFit.cover)),
      ),
      Container(
          width: kWidth(context),
          height: kHeight(context) * 0.5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/opacity.png"), fit: BoxFit.cover))),
      Positioned(
        bottom: kHeight(context) * 0.05,
        left: 20,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   AppStrings.headerTitle,
            //   style: Theme.of(context)
            //       .textTheme
            //       .headlineMedium!
            //       .copyWith(color: Colors.white),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   AppStrings.headerSuTitle,
            //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
            //         color: Colors.white.withOpacity(0.9),
            //       ),
            // ),
            SizedBox(
              height: 20,
            ),
            // SizedBox(
            //     width: 200,
            //     child: MainButton(
            //         text: AppStrings.check, height: 40, ontab: () {}))
          ],
        ),
      ),
    ]);
  }
}
