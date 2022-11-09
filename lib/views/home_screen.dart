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

var searchCon = TextEditingController();

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
                CupertinoIcons.square_favorites,
                color: Colors.white,
                size: 27,
              )),
          SizedBox(width: width * .03)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * .03),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [BoxShadow(offset: Offset(0, 2), blurRadius: 3, color: Colors.grey)]),
              width: width * .9,
              height: height * .07,
              child: Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.search,
                      color: Colors.blue,
                    )),
                SizedBox(
                  height: height * .05,
                  width: width * .75,
                  child: TextFormField(
                      cursorColor: Colors.blue,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      controller: searchCon,
                      cursorHeight: height * .03,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Username',
                        hintStyle: TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
                      )),
                )
              ]),
            ),
            SizedBox(
                height: 500,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: MyDB.catList.length,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: width * .05),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [BoxShadow(offset: Offset(0, 3), blurRadius: 4, color: Colors.grey)]),
                              width: width * .4,
                              height: height * .14,
                              margin: EdgeInsets.only(top: 70),
                            ),
                            Positioned(
                              left: width * .08,
                              bottom: height * .1,
                              width: width * .25,
                              height: 100,
                              child: Image.asset(MyDB.catList[index].values.last),
                            ),
                            Positioned(
                              left: width * .15,
                              top: height * .15,
                              child: Column(
                                children: [
                                  Text(
                                    MyDB.catList[index].values.first,
                                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
