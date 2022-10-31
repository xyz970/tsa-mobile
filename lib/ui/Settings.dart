import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // _load();
  }

  late String theme = "";
  late bool switchVal = Get.isDarkMode == true;
//   Future <void> _load() async{
//   //  SharedPreferences.setMockInitialValues({});
//    final _prefs = await SharedPreferences.getInstance();
//    theme = _prefs.getString("theme")?? "";
//    switchVal = theme == "" ? false : true;
//    print(_prefs.getString("theme"));
//  }
  @override
  Widget build(BuildContext context) {
    // _load();
    return SafeArea(
        child: DefaultTextStyle(
            style: TextStyle(fontFamily: "Poppins"),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                actions: [],
                title: Text("Settings"),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: SizedBox(
                      child: Text(
                        "Display",
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                    ),
                  ),
                  ListTile(
                  leading: Icon(
                    Get.isDarkMode
                        ? FontAwesomeIcons.sun
                        : FontAwesomeIcons.moon,
                  ),
                  title: Text("Dark Mode",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15)),
                  trailing: Switch(
                    value: switchVal,
                    onChanged: (value) async {
                      setState(() {
                        switchVal = value;
                      });
                      if (Get.isDarkMode) {
                        Get.changeThemeMode(ThemeMode.light);
                      } else {
                        Get.changeThemeMode(ThemeMode.dark);
                      }
                      //  final _prefs = await SharedPreferences.getInstance();
                      //  _prefs.getString("theme") == "dark" ?
                      //  _prefs.setString("theme", "") : _prefs.setString("theme", "dark");;
                      //  print(_prefs.getString("theme"));
                    },
                  ),
                ),
                ],
              ),
              // body: Center(
              //   child: Text("Settings"),
              // ),
            )));
  }
}
