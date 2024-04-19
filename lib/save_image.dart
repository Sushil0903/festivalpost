import 'dart:io';

import 'package:festival_post/util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class save extends StatefulWidget {
  const save({super.key});

  @override
  State<save> createState() => _saveState();
}

class _saveState extends State<save> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Image"),
      ),
      body: Column(
        children: [
          savedImg != null ? Image.memory(savedImg!) : Text("Not Save"),
          ElevatedButton.icon(
            onPressed: () async {
              Directory add = await getApplicationDocumentsDirectory();
              String myFilePath = "${add.path}/1.png";
              print(myFilePath);

              File file = File(myFilePath);
              if (savedImg != null) {
                await file.writeAsBytes(savedImg!);
                print(file.path);
                Share.shareXFiles(
                  [
                    XFile(file.path),
                    XFile(file.path),
                  ]);
              }
            },
            icon: Icon(Icons.share),
            label: Text("Share"),
          ),
          ElevatedButton.icon(
            onPressed: () async{
              Directory add = await getApplicationDocumentsDirectory();
              String myFilePath = "${add.path}/1.png";
              print(myFilePath);

              File file = File(myFilePath);
              if (savedImg != null) {
                await file.writeAsBytes(savedImg!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Save")));
              }
            },
            icon: Icon(Icons.download),
            label: Text("Download"),
          ),
        ],
      ),
    );
  }
}
