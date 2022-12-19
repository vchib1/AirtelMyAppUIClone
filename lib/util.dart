import 'package:flutter/material.dart';

const Color fillColor = Color(0xfff8f8ff);


class HorizontalBox extends StatelessWidget {

  final Color boxColor;
  final Color textColor;
  final String text;
  final String textHeading;
  final IconData iconData;
  final String subText;
  final double iconSize;

  const HorizontalBox({Key? key,required this.boxColor,required this.text,required this.textColor,required this.iconData,
  required this.textHeading,required this.iconSize,required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 160,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white,width: 2.0),

      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textHeading,style: const TextStyle(color: Colors.grey,fontSize: 10),),
                Icon(iconData,color: Colors.blue,size: iconSize,)
              ],
            ),
            Text(subText,style: const TextStyle(fontSize: 18.0),),
            Container(
              height: 50,
              width: 135,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: textColor),),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalBox extends StatelessWidget {

  final String imgLocation;

  const VerticalBox({Key? key,required this.imgLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(imgLocation,fit: BoxFit.cover,)
    );
  }
}

class ThreeBox extends StatelessWidget {

  final IconData iconBox;
  final String textBox;
  final Color color1;
  final Color color2;

  const ThreeBox({Key? key,required this.iconBox,required this.textBox,required this.color1,required this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 110,
      decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white,width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 38,
              width: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1,color2]
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(iconBox,size: 22,color: Colors.white,),
            ),
            Text(textBox,style: const TextStyle(fontSize: 14),)
          ],
        ),
      ),
    );
  }
}

class ShortcutsBox extends StatelessWidget {

  final Color color;
  final IconData icon;
  final String text;
  const ShortcutsBox({Key? key,required this.color,required this.icon,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon,size: 32,),
        ),
        const SizedBox(height: 5,),
        Text(text,style: const TextStyle(fontSize: 12,color: Colors.black45),),
      ],
    );
  }

}
