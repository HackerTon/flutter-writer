import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [Locale('en', ''), Locale('es', '')],
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
            brightness: Brightness.dark,
            primarySwatch: Colors.blue),
        home: const _NavigationHome());
  }
}

// class Main extends StatefulWidget {
//   const Main({Key? key}) : super(key: key);

//   @override
//   State<Main> createState() => MainState();
// }

// class MainState extends State<Main> {
//   MainState() : super();

//   final flutterReactBle = FlutterReactiveBle();
//   var items = <DiscoveredDevice>{};
//   final TextStyle textStyle = const TextStyle(
//       color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0);

//   @override
//   void initState() {
//     startScan();
//     super.initState();
//   }

//   void onPressed() {
//     setState(() {
//       items = <DiscoveredDevice>{};
//     });
//     startScan();
//   }

//   void startScan() {
//     try {
//       final stream = flutterReactBle.scanForDevices(
//           withServices: [], requireLocationServicesEnabled: true).listen(null);
//       stream.onData((data) {
//         items.add(data);
//         if (data.name == "FishController") {
//           stream.cancel();
//         }

//         setState(() {
//           items = items;
//         });
//       });
//     } catch (error) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(error.toString())));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 500,
//         margin: const EdgeInsets.all(50),
//         // color: Colors.greenAccent,

//         child: Column(
//           children: [
//             TextButton(onPressed: onPressed, child: const Text("Refresh")),
//             Center(
//                 child: Container(
//               padding: const EdgeInsets.all(15.0),
//               // color: Colors.green,
//               decoration: BoxDecoration(
//                   color: Colors.green, borderRadius: BorderRadius.circular(10)),
//               child: Text(
//                 items.length.toString(),
//                 style: textStyle,
//               ),
//             ))
//           ],
//         ));
//   }
// }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _NavigationHome extends StatefulWidget {
  const _NavigationHome({Key? key}) : super(key: key);

  @override
  State<_NavigationHome> createState() => __NavigationHomeState();
}

class __NavigationHomeState extends State<_NavigationHome>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.black12,
        child: TabBar(
          tabs: const <Tab>[
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "User",
              icon: Icon(Icons.person),
            )
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [HomeScreen(), MyHomePage(title: "not home")],
      ),
    );
  }
}

// home screen
class MyHome extends StatefulWidget {
  MyHome({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<MyHome> createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  final String img =
      "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Hero(
          tag: img,
          child: Image.network(
            img,
            height: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ReportPage(
                img: img,
              );
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report")),
      body: Container(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Center"),
          Hero(
            tag: img,
            child: Image.network(img, height: 20),
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.back_hand),
              label: const Text("Pop back"))
        ]),
      )),
    );
  }
}
