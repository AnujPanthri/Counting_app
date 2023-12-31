// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for hapticfeedback
import 'custombutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor:const Color(0xff000000),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xffffffff),
        ),
        
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  int _counter = 0;
  int _factor = 2;
  final _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter+=_factor;
      // if(_counter%10==0){
      //   toggletheme()
      // }
    });
  }
  void _decrementCounter() {
    setState(() {
      if(_counter>0){
        _counter-=_factor;
        if(_counter<0){
          _counter=0;
        }
      }
      
    });
  }

  void _setFactor(value) {
    setState(() {
      _factor=int.parse(value);
    });
  }
  // _controller.text
  
  @override
  void initState() {
    super.initState();
    _controller.text="$_factor";
  } 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //

    // setState(() {
    // _controller.selection = TextSelection(
    //   baseOffset: 0,
    //   extentOffset: _controller.text.length,
    //   );
      
    // });
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Align(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // alignment: Alignment.topCenter ,
        alignment: Alignment.center ,
        child: Container(
          // margin:const EdgeInsets.only(top:250),
          child:Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count: $_counter',
              style:const TextStyle(fontSize: 35),
            ),
            
          ],
        ),
        ),
      ),
      floatingActionButton:Container(
        margin:const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child:Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

       
      
        CustomButton(
          title: "decrease", 
          onPressed: (){
            HapticFeedback.lightImpact();
            _decrementCounter();
            }, 
          color:const Color.fromARGB(255, 248, 4, 4),
          icon:const Icon(Icons.arrow_downward_rounded),
          // icon: Image.asset("assets/images/mic.png"),
          ),

        CustomButton(
          title: "increase", 
          onPressed:(){
            showDialog(
              context: context, 
              builder: (context){
                return Dialog(
                  backgroundColor:const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(padding:const EdgeInsets.all(7),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    const Text("Factor",
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      backgroundColor:Colors.transparent,
                      ),
                    ),
                    
                    
                    SizedBox(
              width: 200.0,
              child: TextField(
                        // controller: TextEditingController(text: "$_factor"),
                        controller: _controller,
                        onSubmitted: (value){
                            _setFactor(value);
                            Navigator.pop(context);
                          },
                        autofocus: true,
                        decoration:const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Enter the factor',
                        ),
                        style:const TextStyle(
                          backgroundColor:Color.fromARGB(255, 255, 255, 255),
                          color:Colors.black,
                          fontSize: 20,
                        ),

                        keyboardType: TextInputType.number,
                        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        // strutStyle: StrutStyle(),
                    ),
                  ),
                   
                  ],
                  ),

                  ),
                );
                }
              );
            }, 
          color:const Color.fromARGB(255, 255, 255, 255), 
          icon: Text("$_factor",
          style:const TextStyle(color: Colors.black,fontSize:40),
          ),
          // icon: Image.asset("assets/images/mic.png"),
          ),

        CustomButton(
          title: "increase", 
          onPressed: (){
            HapticFeedback.heavyImpact();
            _incrementCounter();
            }, 
          color:const Color.fromARGB(255, 25, 255, 109), 
          icon:const Icon(Icons.arrow_upward_rounded),
          // icon: Image.asset("assets/images/mic.png"),
          ),

       ],
      ),
      ),
     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
