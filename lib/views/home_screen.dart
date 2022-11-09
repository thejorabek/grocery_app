import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/utils/constants/db.dart';
import 'package:grocery_app/utils/routers/router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRouter.cart);
              },
              icon: const Icon(
                CupertinoIcons.shopping_cart,
                color: Colors.white,
                size: 25,
              )),
          SizedBox(width: width * .03)
        ],
      ),
      body: SizedBox(
          height: double.infinity,
          child: GridView.builder(
              itemCount: MyDB.catList.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: width * .05),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        width: 165,
                        height: 115,
                        margin: EdgeInsets.only(top: 70),
                      ),
                      Positioned(
                        left: 25,
                        bottom: 70,
                        child: SvgPicture.asset(MyDB.catList[index].values.last),
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                );
              })),
      drawer: Drawer(),
    );
  }
}
