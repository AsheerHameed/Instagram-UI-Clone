import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
void main() {
  runApp(const Registration());
}
class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:
      const MyHomePage(title: 'Registration Form'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body:
          Center(
        child: Column(
          children: [
            Padding(
            padding:const EdgeInsets.all(5.0),
             child:Center(
             child:Form(
                 child:Column(
                        mainAxisAlignment:MainAxisAlignment.center ,
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.all(10),
                          child:Image.asset("images/login3.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child:   TextFormField(
                            decoration: const InputDecoration(
                                labelText:'User Name',
                                hintText: 'Input a username',
                                border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20.0)),),
                                suffixIcon:Icon(Icons.mail)
                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 5),
                              child:TextFormField(
                            decoration: const InputDecoration(
                              labelText:'Password',
                    hintText: 'Enter your password',
                    border:OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(20.0)),
                    ),
                            suffixIcon:Icon(Icons.lock)
                ),
                obscureText:true,
              ),
            ),
                        ElevatedButton(onPressed: ()
                        {
                          foregroundColor:Colors.grey;
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>const MyApp())
                        );
                         }, child: const Text("Login"),)
                ],
                            ),
                          ),
                      ),
            ),
          ],
        ),
    ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
