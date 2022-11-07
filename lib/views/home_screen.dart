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
      body: Column(
        children: [
          Text("Kategoriyalar ro'yxati"),
          ListView.builder(
              shrinkWrap: true,
              itemCount: MyDB.catList.length,
              itemBuilder: (context, index) {
                return Container(
                    width: width * .1,
                    height: height * .05,
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [Text(MyDB.catList[index].values.first), SvgPicture.asset('assets/splash_pic.svg')],
                    ));
              })
        ],
      ),
      drawer: Drawer(),
    );
  }
}
