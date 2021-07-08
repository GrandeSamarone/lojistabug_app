import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lojista',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lojista'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;
  TextEditingController token_Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

                Text("before sending notification put motoboyappbug app token on sendNotificationMap"),


            TextButton(onPressed: (){
              SendNotification();
            }, child: Text("send notification")),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   SendNotification() async {
    Map<String, String> headerMap =
    {
      'Content-Type': 'application/json',
      'Authorization':"key=AAAAdwUeydQ:APA91bHbF51HUcM5KIbekO2olX6QcYYZuieZ8mGTawlCgtm56r"
          "_sLkNZgAXPFienpyzY40xb525THiEEFp1bCOGtwFQTtuwGTU9HDI2nDtp5OvglH4YCPTw5E48Mq7G24mKb9ZFV5x42",

    };

    Map notificationMap =
    {
      'body': "marlostestenotificacaopessoal",
      'title':"marlosteste"
    };

    Map dataMap =
    {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      "distrito":"2",
      "quant_itens": "2",
      "total":"2",
      "telefone": "2",
      "nome_ponto": "marlos",
      "end_ponto": "marlos",
      "lat_ponto":"-3.0607180226276642",
      "long_ponto": "-59.97213263064623",
      "id_doc":"id_doc",
    };


    Map sendNotificationMap =
    {
      "notification": notificationMap,
      "data": dataMap,
      "priority": "high",
      "timeToLive": 60 * 60 * 24,
      // token
      "to":"",
    };

    var res = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: headerMap,
      body: jsonEncode(sendNotificationMap),
    );
  }
}