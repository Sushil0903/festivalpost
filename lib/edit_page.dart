import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:festival_post/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? xfile;
  String Text1 = " ";
  double ff = 5;
  Color? fontColor;

  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () async{
              RenderRepaintBoundary rrb = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
              var image = await rrb.toImage();
              var pngImg = await image.toByteData(format: ImageByteFormat.png);
              Uint8List? asUint8List = pngImg?.buffer.asUint8List();


              print("asUint8List $asUint8List");
              savedImg=asUint8List;
              Navigator.pushNamed(context, "save_image");
                  Navigator.pushNamed(context, "save_image");
            },
              child: Text("Save",style: TextStyle(fontSize: 22),)),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                RepaintBoundary(
                  key: key,
                  child: Container(
                      width: double.infinity,
                      height: 400,
                      color: Colors.yellow,
                      child: xfile == null
                          ? Image.network(
                              "https://cdn.pixabay.com/photo/2017/11/10/05/24/add-2935429_960_720.png")
                          : Image.file(
                              File(
                                xfile ?? "Add Image",
                              ),
                              fit: BoxFit.cover)),
                ),
                Text(
                  "$Text1",
                  style: TextStyle(fontSize: ff,color: fontColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () async {
                  XFile? imp =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  xfile = imp?.path ?? "";
                  setState(() {});
                },
                child: Container(
                  child: Text(
                    "  + ADD image  ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20)),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                onChanged: (value) {
                  Text1 = value;
                  setState(() {});
                },
                decoration: InputDecoration(hintText: "Add text",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Font Size",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
            Slider(
              min: 5,
              max: 60,
              value: ff,
              onChanged: (value) {
                ff = value;
                setState(() {});
              },
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Pick a color",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bgColor.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      fontColor = Color(bgColor[index]);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Color(bgColor[index]),borderRadius: BorderRadius.circular(15)),
                      
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
