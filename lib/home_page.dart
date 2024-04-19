import 'package:festival_post/util.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Festival Post",style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 10),
            child: Text("Festival Post",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
             children: img.map((e) {
               return  Row(
                 children: [
                   InkWell(
                     onTap: () {
                       Navigator.pushNamed(context, "edit",arguments: e);
                       setState(() {

                       });
                     },
                     child: Container(
                       clipBehavior: Clip.antiAlias,
                       margin: EdgeInsets.only(left: 15),
                       height: 150,
                       width: 150,
                       decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),
                       child: Image.network(e["img"]??"Loding...",fit: BoxFit.cover,),
                     ),
                   ),
                 ],
               );
             }).toList(),
            ),
          ),

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 10),
            child: Text("Bussiness Post",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: img1.map((e) {
                return  Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "edit",arguments: e);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.only(left: 15),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),
                        child: Image.network(e["img"],fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 10),
            child: Text("Social Media Post",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: img2.map((e) {
                return  Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "edit",arguments: e);
                      },

                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.only(left: 15),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),
                        child: Image.network(e["img"],fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "edit_page");
            },
            child: Container(
              margin: EdgeInsets.only(left: 100,top: 40),
              height: 55,
              width: 200,
              decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(30)),
              child: Center(child: Text("Make Costom",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
          ),
        ],
      ),
          );
  }
}
