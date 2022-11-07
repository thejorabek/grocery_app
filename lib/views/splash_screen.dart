import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/utils/constants/colors.dart';
import 'package:grocery_app/utils/routers/router.dart';
import 'package:grocery_app/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .07, vertical: height * .07),
        child: Column(children: [
          SizedBox(height: height * .05),
          SvgPicture.asset('assets/splash_pic.svg'),
          SizedBox(height: height * .1),
          const Text(
            'Explore and order your favourite\ngrocery items.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: height * .15),
          MyButton(
            width: width,
            height: height,
            color: MyColors.yellow,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, MyRouter.home, (route) => false);
            },
          )
        ]),
      ),
    );
  }
}
