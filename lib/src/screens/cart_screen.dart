

import 'package:flutter/material.dart';
import 'package:practica_01_fruit_app/src/utils/colors_palette.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  ElevatedButton btnBuy = ElevatedButton(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: ColorPalette.colorFruitAppFont
      ),
      primary: ColorPalette.colorFruitAppElement
    ),
    onPressed: (){},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Buy Fruit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorPalette.colorBlack
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.colorFruitAppBG, 
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            color: ColorPalette.colorFont, 
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          )
        ),
        elevation: 0,
        backgroundColor: ColorPalette.colorPrimary,
        leading: Row(
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            IconButton(
              color: ColorPalette.colorFruitAppElement,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/fruit");
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
        alignment: Alignment.bottomCenter,
        child: btnBuy,
      )
    );
  }
}