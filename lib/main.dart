

//import 'package:flutter/material.dart';
//import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:web_socket_channel/status.dart' as statusCodes;
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
//const URL = 'ws://192.168.0.24:8080/gs-guide-websocket/websocket';
////const URL = 'wss://echo.websocket.org';
//
//
//
//void main() =>
//    runApp(MyApp());
//
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: FauxLoginPage(),
//    );
//  }
//}
//
//class FauxLoginPage extends StatelessWidget {
//  final TextEditingController controller = TextEditingController();
//
//  void goToMainPage(String nickname, BuildContext context) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => AnnouncementPage(nickname)
//        )
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) =>
//      Scaffold(
//          appBar: AppBar(title: Text("Login Page")),
//          body: Center(
//            child: Column(
//              children: [
//                TextField(
//                  controller: controller,
//                  decoration: InputDecoration(
//                      labelText: "Nickname"
//                  ),
//                  onSubmitted: (nickname) => goToMainPage(nickname, context),
//                ),
//                FlatButton(
//                    onPressed: () => goToMainPage(controller.text, context),
//                    child: Text("Log In")
//                )
//              ],
//            ),
//          )
//      );
//}
//
//class AnnouncementPage extends StatefulWidget {
//  AnnouncementPage(this.nickname);
//
//  final String nickname;
//
//  @override
//  AnnouncementPageState createState() => AnnouncementPageState();
//}
//
//class AnnouncementPageState extends State<AnnouncementPage> {
//  WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(URL));
////  Future<StompClient> client = customStomp.connect('ws://192.168.0.21:8080/websocket', ...);
//
//  TextEditingController controller = TextEditingController();
//  var sub;
//  String text;
//
//  @override
//  void initState() {
//    super.initState();
//
//    FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
//    var androidInit = AndroidInitializationSettings('ic_notification');
//    var iOSInit = IOSInitializationSettings();
//    var init = InitializationSettings(androidInit, iOSInit);
//    notifications.initialize(init).then((done) {
//      sub = channel.stream.listen((newData) {
//        setState(() {
//          text = newData;
//        });
//
//        notifications.show(
//            0,
//            "New announcement",
//            newData,
//            NotificationDetails(
//                AndroidNotificationDetails(
//                    "announcement_app_0",
//                    "Announcement App",
//                    ""
//                ),
//                IOSNotificationDetails()
//            )
//        );
//      });
//    });
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    channel.sink.close(statusCodes.goingAway);
//    sub.cancel();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Announcement Page"),
//      ),
//      body: Center(
//          child: Column(
//            children: <Widget>[
//              text != null ?
//              Text(text, style: Theme.of(context).textTheme.display1)
//                  :
//              CircularProgressIndicator(),
//              TextField(
//                controller: controller,
//                decoration: InputDecoration(
//                    labelText: "Enter your message here"
//                ),
//              )
//            ],
//          )
//      ),
//      floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.send),
//          onPressed: () {
//            channel.sink.add("'/app/hello',${widget.nickname}: ${controller.text}");
//          }
//      ),
//    );
//  }
//}


//import 'package:flutter/foundation.dart';
//import 'package:web_socket_channel/io.dart';
//import 'package:flutter/material.dart';
//import 'package:web_socket_channel/web_socket_channel.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final title = 'WebSocket Demo';
//    return MaterialApp(
//      title: title,
//      home: MyHomePage(
//        title: title,
//        channel: IOWebSocketChannel.connect('ws://192.168.0.24:8080/gs-guide-websocket/websocket'),
//      ),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  final String title;
//  final WebSocketChannel channel;
//
//  MyHomePage({Key key, @required this.title, @required this.channel})
//      : super(key: key);
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController _controller = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Form(
//              child: TextFormField(
//                controller: _controller,
//                decoration: InputDecoration(labelText: 'Send a message'),
//              ),
//            ),
//            StreamBuilder(
//              stream: widget.channel.stream,
//              builder: (context, snapshot) {
//                return Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 24.0),
//                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
//                );
//              },
//            )
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _sendMessage,
//        tooltip: 'Send message',
//        child: Icon(Icons.send),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//
//  void _sendMessage() {
//    if (_controller.text.isNotEmpty) {
//      widget.channel.sink.add(_controller.text);
//    }
//  }
//
//  @override
//  void dispose() {
//    widget.channel.sink.close();
//    super.dispose();
//  }
//}

import 'package:flutter/material.dart';
import 'package:websockets/new_websocket.dart' show connect;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      connect("ws://192.168.0.24:8080/gs-guide-websocket/websocket").then((stompClient) {
        stompClient.subscribeString(
            "123", "/topic/greetings", (Map<String, String> headers,
            String message) {
          print("receive message: " + message);
        });
        stompClient.sendString("/app/hello", _counter.toString());
      }, onError: (error) {
        print("connect failed");
      });
    });
  }

        @override
        Widget build(BuildContext context) {
      // This method is rerun every time setState is called, for instance as done
      // by the _incrementCounter method above.
      //
      // The Flutter framework has been optimized to make rerunning build methods
      // fast, so that you can just rebuild anything that needs updating rather
      // than having to individually change instances of widgets.
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also layout widget. It takes a list of children and
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
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }


