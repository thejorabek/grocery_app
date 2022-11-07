import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/utils/constants/colors.dart';

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
          Container(
            decoration: BoxDecoration(color: MyColors.yellow, borderRadius: BorderRadius.circular(20)),
            width: width * .5,
            height: height * .07,
            child: const Center(
                child: Text(
              'Explore',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
          )
        ]),
      ),
    );
  }
}
