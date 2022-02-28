

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practica_01_fruit_app/src/utils/colors_palette.dart';

class FruitScreen extends StatefulWidget {
  FruitScreen({Key? key}) : super(key: key);

  @override
  State<FruitScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {

  final List<String> imgList = [
    "assets/images/fruits_mango.png",
    "assets/images/fruits_apple.png",
    "assets/images/fruits_grapes.png",
  ];

  int _n = 0;
  int _amt = 0;

  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.colorFruitAppBG, 
      appBar: AppBar(
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
              onPressed: () {},
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            color: ColorPalette.colorFruitAppElement,
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/shopping_cart");
            },
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SliderFruits(),
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.colorFruitAppCard,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                height: 555.0,
                width: 500.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Mango',
                          style: TextStyle(
                              fontSize: 30.0, 
                              fontWeight: 
                              FontWeight.bold,
                            ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('1 each'),
                        SizedBox(
                          height: 20.0,
                        ),
                        CounterFruit(),
                        SizedBox(
                          height: 35.0,
                        ),
                        Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: 20.0, 
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.colorFruitAppFont,
                            fontFamily: 'MeriendaOne'
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          'A mango is a type of fruit. '
                          'The mango tree is native to South Asia, '
                          'from where it has been taken to become one of the most widely cultivated fruits in the tropics.'
                          'It is harvested in the month of march (summer season) till the end of May.',
                          style: TextStyle(
                            letterSpacing: 2.0, 
                            fontSize: 15.0,
                            color: ColorPalette.colorFruitAppFont,
                            fontFamily: 'MeriendaOne'
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: <Widget>[
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: ColorPalette.colorBack
                                ),
                              ),
                              height: 70.0,
                              child: RaisedButton(
                                color: ColorPalette.colorGray,
                                elevation: 0.0,
                                child: IconButton(
                                  icon: _isFavorited
                                  ? Icon(
                                      Icons.favorite_border,
                                      color: ColorPalette.colorFruitAppElement,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: ColorPalette.colorFruitAppElement,
                                  ), 
                                  onPressed: () {
                                    setState(() {
                                      _isFavorited = !_isFavorited;
                                    });
                                  },
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isFavorited = !_isFavorited;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              height: 70.0,
                              minWidth: 260.0,
                              child: RaisedButton(
                                elevation: 0.0,
                                color: ColorPalette.colorGray,
                                onPressed: () {},
                                child: Text(
                                  'Add to cart',
                                  style:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorPalette.colorBlack
                                      ),
                                ),
                              ),
                            )
                          ]
                        ),
                      ]
                    )
                  )
                )
              ),
            ]
          )
        ]
      )
    );
  }

  Widget SliderFruits()
  {
    int _current = 0;

    return Column(
      children: [
      CarouselSlider(
        items: imgList.map((item) => Container(
          child: Center(
            child: Image.asset(
              item.toString()
            )
          ),
        )).toList(),
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
        ),
      ]
    );
  }

  Widget CounterFruit() 
  {
    return Row(
      children: <Widget>[
        Container(
          width: 155.0,
          decoration: BoxDecoration(
            color: ColorPalette.colorFruitAppElement,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  add();
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text('$_n', style: new TextStyle(fontSize: 30.0)),
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onPressed: () {
                  minus();
                },
              ),
            ]
          )
        ),
        SizedBox(
          width: 40.0,
        ),
        Container(
          child: Text(
            'Rs $_amt',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          )
        ),
      ]
    );
  }

  void add() {
    setState(() {
      _n++;
      _amt = _amt + 10;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
      if (_amt != 0) _amt = _amt - 10;
    });
  }
}

