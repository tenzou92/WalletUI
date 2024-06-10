// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/pages/generate_qr.dart';
import 'package:walletappui/pages/scan_QR.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_list_tile.dart';
import 'game_page.dart';
import '../util/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

  void _showSettingsBottomSheet(BuildContext context) {
    double brightnessValue = 0.5;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Adjust Brightness',
                    style: TextStyle(fontSize: 20),
                  ),
                  Slider(
                    value: brightnessValue,
                    onChanged: (double value) {
                      setState(() {
                        brightnessValue = value;
                        print('Brightness: $brightnessValue');
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(
          Icons.tap_and_play,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.red[200],
                ),
              ),
              IconButton(
                onPressed: () {
                  _showSettingsBottomSheet(context);
                },
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Cards',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 220,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                      balance: 5290.12,
                      cardNumber: 1001602776812,
                      expiryMonth: 21,
                      expiryYear: 25,
                      bank: 'Bank Islam',
                      color: Colors.red,
                    ),
                    MyCard(
                      balance: 212.90,
                      cardNumber: 560148733748,
                      expiryMonth: 21,
                      expiryYear: 25,
                      bank: 'Maybank',
                      color: Color.fromARGB(255, 183, 166, 6),
                    ),
                    MyCard(
                      balance: 300.78,
                      cardNumber: 656677199081,
                      expiryMonth: 21,
                      expiryYear: 25,
                      bank: 'RHB',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      buttonText: 'Generate QR',
                      iconImagePath: 'lib/icons/qr-code.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => First()),
                        );
                      },
                    ),
                    MyButton(
                      buttonText: 'Scan QR',
                      iconImagePath: 'lib/icons/scanQR.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Second()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    MyListTile(
                      iconImagePath: 'lib/icons/snake.png',
                      tileTittle: 'Game',
                      tileSubTitle: 'Snake',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SnakeGamePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
