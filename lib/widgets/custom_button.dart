import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.width, required this.height, required this.onTap, required this.color}) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(offset: Offset(0, 2), blurRadius: 3, color: Colors.grey)]),
          width: width * .5,
          height: height * .07,
          child: const Center(
              child: Text(
            'Explore',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
        ));
  }
}
