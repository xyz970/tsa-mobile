import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mytsa/ui/Home.dart';
import 'package:mytsa/ui/Login.dart';
import 'package:mytsa/ui/Telegram.dart';
import 'package:mytsa/ui/Theme.dart';
import 'package:mytsa/ui/tugas.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String theme = "";
// late Future<String> theme;
  @override
  void initState() {
    // TODO: implement initState
    // theme = _prefs.
    // _load();
    super.initState();
  }

//  void _load() async{
//    SharedPreferences.setMockInitialValues({});
//    final _prefs = await SharedPreferences.getInstance();
//    theme = _prefs.getString("theme")?? "";
  getPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("email");
  }

//  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Mytsa",
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: DefaultTextStyle(
        style: TextStyle(fontFamily: "Poppins"),
        // child: getPrefs() == " " ? LoginWidget() : Home(),
        child: Tugas(),
      ),
    );
  }
}
