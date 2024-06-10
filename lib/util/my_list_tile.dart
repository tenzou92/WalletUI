// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String iconImagePath;
  final String tileTittle;
  final String tileSubTitle;
  final VoidCallback onTap;

  const MyListTile({
    Key? key,
    required this.iconImagePath,
    required this.tileTittle,
    required this.tileSubTitle,
    required this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: InkWell(
        onTap: onTap,
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //icons 
                 Row(children: [
                   Container(
                    height: 80,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      ),
                    child: Image.asset(iconImagePath),
                  ),
    
                  SizedBox(width: 20), // make move to the right 
            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // make the word at the start
                    children: [
                      Text(
                        tileTittle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        SizedBox(height: 8),
                      Text(
                        tileSubTitle,
                         style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        ),
                  ],
                  ),
                 ],
                 ),
            
                  Icon(Icons.arrow_forward_ios),
                ],
                ),
    ),
    );
  }
}