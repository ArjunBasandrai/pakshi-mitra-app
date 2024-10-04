import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;

  TopBar({Key? key})
      : preferredSize = Size.fromHeight(56.0), // Set the height of the app bar.
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 75,
        backgroundColor: const Color(0xFFE9EFEC),
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Image.asset('assets/logo.png', height: 41.05),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Pakshi Mitra', style: TextStyle(color: Color(0xFF1B5E20), fontSize: 20)),
                      Text('पक्षी मित्र', style: TextStyle(color: Color(0xFF1B5E20), fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Icon(
                Icons.translate,
                color: Color(0xFF1B5E20),
                size: 32,
              ),
            )
          ],
        )
    );
  }
}
