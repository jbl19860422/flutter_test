import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:orientation/orientation.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:simple_animations/simple_animations.dart';
import 'package:platform/platform.dart';
//void main() => runApp(MyApp());

//void main() => runApp(
//    Center(
//      child:new Text(
//          "hello world1",
//          textDirection:TextDirection.ltr
//      )
//    )
//);

void main() {
  OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
  runApp(MyApp1());
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  RandomWordsState createState() => RandomWordsState();
  Widget build(BuildContext context) {
//    final workPair = WordPair.random();
//    return Text(workPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text("startup name generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
          child: Image.asset('images/d53e1c80d88575b31d5d946526acaa20.png')),
      Expanded(
          flex: 2,
          child: Image.asset('images/a5d2907c60dc982cc48c79e35168c453.jpg')),
      Expanded(
          child: Image.asset('images/5ce00b4d56b8d21da117070aba3dda6d.jpg')),
    ]);
//    return ListTile(
//      title:Text(
//        pair.asPascalCase,
//        style:_biggerFont,
//      )
//    );
  }
}

//like view
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();


}

//like model
class _FavoriteWidgetState extends State<FavoriteWidget> {
  //model
  bool _isFavorited = true;
  int _favoriteCount = 41;
  String _batteryLevel = 'Unknown battery level.';
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
      _favoriteCount = result;
    } on PlatformException catch(e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  void _toggleFavorite() {
    setState(() {
      _getBatteryLevel();
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  //controller view
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          )),
      SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount',
                style: TextStyle(
                    color: Color.fromARGB(255, 0x2b, 0x2b, 0x2b),
                    fontSize: 14,
                    decoration: TextDecoration.none)),
          ))
    ]);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class MyContainer extends Container {}

class MyApp1 extends StatelessWidget {
  final tween = MultiTrackTween([
    Track("size").add(Duration(seconds: 4), Tween(begin: 0.0, end: 150.0)),
    Track("color")
        .add(Duration(seconds: 2),
            ColorTween(begin: Colors.red, end: Colors.blue),
            curve: Curves.easeIn)
        .add(Duration(seconds: 2),
            ColorTween(begin: Colors.blue, end: Colors.green),
            curve: Curves.easeOut),
    Track("rotation").add(Duration(seconds: 1), ConstantTween(0.0)).add(
        Duration(seconds: 3), Tween(begin: 0.0, end: pi / 2),
        curve: Curves.easeOutSine)
  ]);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('welcome to flutter'),
          ),
          body: Scrollbar(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(0.0),
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                                "images/a5d2907c60dc982cc48c79e35168c453.jpg"),
                            Container(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          "Oeschinen Lake Campground",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0x2b,
                                                                      0x2b,
                                                                      0x2b),
                                                              fontSize: 14,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          "Kandersteg, Switzerland",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0xcc,
                                                                      0xcc,
                                                                      0xcc),
                                                              fontSize: 12,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none))
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ])),
                                    FavoriteWidget(),
                                  ],
                                )),
                            Container(
                                child: Row(children: [
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.phone,
                                          color: Colors.blueAccent),
                                      Text("CALL",
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                              color: Colors.blueAccent))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.access_alarm,
                                          color: Colors.blueAccent),
                                      Text("ROUTE",
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                              color: Colors.blueAccent))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.add_alert,
                                          color: Colors.blueAccent),
                                      Text("SHARE",
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                              color: Colors.blueAccent))
                                    ],
                                  )
                                ],
                              ))
                            ])),
                            Container(
                                padding: const EdgeInsets.all(30),
                                margin: const EdgeInsets.only(
                                    left: 15, right: 15, top: 30),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                                          'Alps. Situated 1,578 meters above sea level, it is one of the '
                                          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                                          'half-hour walk through pastures and pine forest, leads you to the '
                                          'lake, which warms to 20 degrees Celsius in the summer. Activities '
                                          'enjoyed here include rowing, and riding the summer toboggan run.',
                                          softWrap: true,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 11,
                                              color: Color.fromARGB(
                                                  255, 0x70, 0x70, 0x70))),
                                      Text(
                                          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                                          'Alps. Situated 1,578 meters above sea level, it is one of the '
                                          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                                          'half-hour walk through pastures and pine forest, leads you to the '
                                          'lake, which warms to 20 degrees Celsius in the summer. Activities '
                                          'enjoyed here include rowing, and riding the summer toboggan run.',
                                          softWrap: true,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 11,
                                              color: Color.fromARGB(
                                                  255, 0x70, 0x70, 0x70))),
                                      Text(
                                          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                                          'Alps. Situated 1,578 meters above sea level, it is one of the '
                                          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                                          'half-hour walk through pastures and pine forest, leads you to the '
                                          'lake, which warms to 20 degrees Celsius in the summer. Activities '
                                          'enjoyed here include rowing, and riding the summer toboggan run.',
                                          softWrap: true,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 11,
                                              color: Color.fromARGB(
                                                  255, 0x70, 0x70, 0x70))),
                                      Text(
                                          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                                          'Alps. Situated 1,578 meters above sea level, it is one of the '
                                          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                                          'half-hour walk through pastures and pine forest, leads you to the '
                                          'lake, which warms to 20 degrees Celsius in the summer. Activities '
                                          'enjoyed here include rowing, and riding the summer toboggan run.',
                                          softWrap: true,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 11,
                                              color: Color.fromARGB(
                                                  255, 0x70, 0x70, 0x70)))
                                    ]))
                          ]))))),
    );
  }
}

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
