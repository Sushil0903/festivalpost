import 'package:festival_post/edit.dart';
import 'package:festival_post/edit_page.dart';
import 'package:festival_post/home_page.dart';
import 'package:festival_post/save_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}


class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) => Homepage(),
        "edit_page":(context) => Edit(),
        "save_image":(context) => save(),
        "edit":(context) => edit(),
      }
    );
  }
}
