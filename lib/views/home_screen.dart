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
    var searchCon = TextEditingController();
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
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      controller: searchCon,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                          filled: true,
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10, color: Colors.white)),
                          hintText: 'Enter your Username',
                          hintStyle: TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
                          fillColor: Color.fromARGB(129, 0, 0, 0))),
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
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              width: 165,
                              height: 115,
                              margin: EdgeInsets.only(top: 70),
                            ),
                            Positioned(
                              left: 25,
                              bottom: 70,
                              width: 100,
                              height: 100,
                              child: SvgPicture.asset(MyDB.catList[index].values.last),
                            ),
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
