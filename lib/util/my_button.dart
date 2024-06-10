import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.buttonText,
    required this.iconImagePath,
    required this.onPressed,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
              children: [
                //icon
                  Container(
                height: 90, //besarkn icon atau kecilkan icons
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 30,
                      spreadRadius: 10,
                    )
                  ]
                  ),
                child: Center(
                child: Image.asset(iconImagePath),
              ),
              ),
              SizedBox(height: 4),
              //text
              Text(
              buttonText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              ),
            ],
            ),
    );
  }
}