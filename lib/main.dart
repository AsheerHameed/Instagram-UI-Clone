import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'regg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        //  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black12)
      ),
      home: const MyHomePage(
        title: 'Instagram',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      Navigator.of(context);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      Text('Failed to pick image: $e');
    }
  }
  late AppBar topBar =  AppBar(
    backgroundColor: Colors.black87,
    centerTitle: true,
    actions: [
      const Padding(
        padding: EdgeInsets.only(left: 15, top: 5),
        child: Text('Instagram',
            style: TextStyle(fontFamily: "Billabong", fontSize: 39)),
      ),
      const Spacer(flex: 130),
      IconButton(
        icon: const Icon(Icons.camera_alt_outlined, size: 28),
        tooltip: 'Add a post',
        onPressed: () {
          pickImage(ImageSource.camera);
        },
      ),
      const Spacer(
        flex: 1,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          icon: const Icon(Icons.chat_bubble_outline, size: 28),
          tooltip: 'add a post',
          onPressed: () {},
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: topBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  stories(),
                ],
              )),
          Container(
            height: 702,
            width: double.infinity,
            color: Colors.black87,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                const SizedBox(
                  width: 20,
                  height: 5,
                ),
                const Divider(height:5,thickness: 2,),
                post(),
                likes(),
                likedBy(),
                const Divider(height:12,thickness: 2,),
                post(),
                likes(),
                likedBy(),
                const Divider(height:12,thickness: 2,),
                post(),
                likes(),
                likedBy(),
                const Divider(height:12,thickness: 2,),
                post(),
                likes(),
                likedBy()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black12,
        height: 60.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, size: 30),
              tooltip: 'Home',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Image.asset('images/download.gif')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, size: 30),
              tooltip: 'Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Image.asset('images/download.gif')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_box_outlined, size: 30),
              tooltip: 'Add a post',
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
            ),
            // buildButton(
            //   icon:Icons.add_box_outlined,
            //   onClicked:()=>pickImage(ImageSource.camera),
            // ),
            IconButton(
              icon: const Icon(Icons.favorite, size: 30),
              tooltip: 'Activity',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Image.asset('images/download.gif')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined, size: 30),
              tooltip: 'Switch accounts',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Registration()));
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


//story
List <String> storiesImages =
[
  "images/ash.jpg",
  "images/post4.jpg",
  "images/post11.jpeg",
  "images/profile_pic2.jpg",
  "images/profile_pic3.jpg",
  "images/profile_pic4.jpg",
  "images/profile_pic5.jpg",
  "images/profile_pic6.jpg",
  "images/profile_pic6.jpg",
  "images/profile_pic6.jpg",
  "images/profile_pic6.jpg",
  "images/profile_pic6.jpg",
];
Widget stories() => Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children:List.generate(12,(index)=>
            Container(
              padding:(const EdgeInsets.all(5)),
              child:Column(
                children: [
                  CircleAvatar(
                    radius:30,
                    backgroundImage: const AssetImage("images/story.png"),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage:AssetImage(storiesImages[index]),
                    ),
                  ),
                  const SizedBox(height:0,width: 10,),
                  const Text("asheerhameed",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
        ),
        ),
      ),
    ),
  ],
);
//posts
Widget post() => Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left:10,right: 3),
                    child:CircleAvatar(
                      radius:18,
                      backgroundImage: AssetImage("images/story.png"),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundImage:AssetImage("images/profile_pic7.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('asheerhameed', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Spacer(flex: 2),
                  Icon(Icons.more_vert),
                ],
          ),
        ),
        Container(
          height: 631,
          width: 687,
          decoration: const BoxDecoration(
            //color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/post8.jpg'),
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
          ),
        ),
      ],
    );

// likes
Widget likes() => Padding(
      padding: const EdgeInsets.only(left: 9, bottom: 9),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 9),
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 9),
            child: Icon(
              Icons.comment_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 9),
            child: Icon(Icons.near_me_outlined, size: 30),
          ),
        ],
      ),
    );
Widget likedBy() => const Padding(
      padding: EdgeInsets.only(left: 25),
      child: Text('Liked by asheerhameed and 223,987 others',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
