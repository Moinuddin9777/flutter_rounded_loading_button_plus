import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Loading Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  
  final RoundedLoadingButtonController _btnController3 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 10), () {
      controller.success();
    });
  }

  @override
  void initState() {
    super.initState();
    _btnController1.stateStream.listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rounded Loading Button Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedLoadingButton(
                successIcon: Icons.cloud,
                failedIcon: Icons.cottage,
                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
                controller: _btnController1,
                onPressed: () => _doSomething(_btnController1),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                color: Colors.amber,
                successColor: Colors.amber,
                controller: _btnController2,
                onPressed: () => _doSomething(_btnController2),
                valueColor: Colors.black,
                borderRadius: 10,
                child: Text('''
Tap me i have a huge text''', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                color: Colors.amber,
                successColor: Colors.amber,
                controller: _btnController3,
                onPressed: () => _doSomething(_btnController3),
                valueColor: Colors.black,
                borderRadius: 10,
                borderColor: Colors.blue.shade700,
                borderWidth: 2,
                shadowColor: Colors.blue.withOpacity(0.5),
                shadowBlurRadius: 8,
                gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade700],
                ),
                child: Text('''
Tap me i have customized style''', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  onPressed: () {
                    _btnController1.reset();
                    _btnController2.reset();
                    _btnController3.reset();
                  },
                  child: Text('Reset')),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.error();
                  _btnController2.error();
                  _btnController3.error();
                },
                child: Text('Error'),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.success();
                  _btnController2.success();
                  _btnController3.success();
                  // _btnController1
                  print(_btnController1.currentState);
                },
                child: Text('Success'),
              )
            ],
          ),
        ));
  }
}
