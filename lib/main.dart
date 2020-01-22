import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:firebase_admob/firebase_admob.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Message Sender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Multiple Message Sender'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _numbersController ;
  TextEditingController _messageController ;
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId:
    "ca-app-pub-7829821407228725~8757030991");
    _numbersController = new TextEditingController();
    _messageController = new TextEditingController();
    super.initState();
  }

  void _openAd()
  {
    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()..load();
    _interstitialAd?.show();
  }

  void _sendSMS() async {
//    String message = "This is a test message!";
//    List<String> delimiters = [',', ' ', "'"];

    List<String> list = _numbersController.text.split(",");
    String _result = await FlutterSms
        .sendSMS(message: _messageController.text, recipients: list)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child:
          Column(children: <Widget>[
            Expanded(flex: 1,
              child: Container(
                color: Color(0xffeeeeee),
                padding: EdgeInsets.all(10.0),
                child: new Scrollbar(
                  child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: false,
                      child: new TextField(
                          maxLines: 100,
                          controller: _numbersController,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal)),
                              hintText: 'Enter numbers')
                      )
                  ),
                ),
              ),),
            TextField(controller: _messageController,
                decoration:
                InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.message),
                    labelText: "Enter message")),
            Padding(padding: EdgeInsets.all(10.0),),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(color: Colors.blue,onPressed: () {

                  _openAd();
                },
                    child: Text("SUBMIT",
                      style: TextStyle(color: Colors.white),))
            )
          ],)
      ),
    );
  }


  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return "ca-app-pub-7829821407228725/7165226658";
    } else if (Platform.isAndroid) {
      return "ca-app-pub-7829821407228725/1119333685";
    }
    return null;
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: getInterstitialAdUnitId(),
      listener: (MobileAdEvent event) {
        switch(event)
        {
          case MobileAdEvent.failedToLoad:
            _sendSMS();
            break;
          case MobileAdEvent.closed:
            _sendSMS();
            break;
          case MobileAdEvent.opened:
            break;
          case MobileAdEvent.loaded:
            break;
          case MobileAdEvent.clicked:
            break;
          case MobileAdEvent.impression:
            break;
          case MobileAdEvent.leftApplication:
            break;
        }
        print("InterstitialAd event $event");
      },
    );
  }
}
