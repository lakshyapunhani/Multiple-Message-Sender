import 'package:flutter/material.dart';
import 'package:multiple_message_sender/data/moor_database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HistoryState();
  }
}

class HistoryState extends State<HistoryScreen>
{

  List<Message> _messages = <Message>[];
  var database;
  var formatter;

  @override
  void initState() {
    getProjectDetails();
  }

  void getProjectDetails() async {
    database = Provider.of<MoorDatabase>(context,
        listen: false);
    _messages = await database.getAllMessages();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
    Scaffold(appBar: AppBar(title: Text("History")),
        body: Container(child:
        ListView.builder(itemBuilder:(context, position){
          return Container(margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border:
              Border.all(color: Colors.black)),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(_messages[position].numbers,
                    style: TextStyle(fontSize: 14),textAlign:TextAlign.left),
                  Container(margin: EdgeInsets.all(5)),
                  Text(_messages[position].messageText,
                      style: TextStyle(fontSize: 20),textAlign:TextAlign.left),
                  Container(margin: EdgeInsets.all(5),),
                  Text(new DateFormat.yMEd().add_jms().format( _messages[position].timestamp),
                      style: TextStyle(fontSize: 12),textAlign: TextAlign.left),
                ],));
        },itemCount: _messages.length),
        )));
  }

}