import 'package:flutter/material.dart';
import 'package:mytsa/ui/Login.dart';
import 'package:mytsa/ui/Settings.dart';
import 'package:mytsa/ui/profile.dart';
import 'package:mytsa/ui/rumah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
 deleteLogin() async{
     SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove("email");
    _prefs.remove("password");
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Adi Saputro"),
                  accountEmail: Text("muhammadxxz7@gmail.com"),
                  currentAccountPictureSize: Size(80, 80),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  )),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                 onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Rumah(),
                        ));
                }
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
                 onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                }
              ),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ));
                }
              ),
              Divider(),
              ListTile(
                title: Text("Logout"),
                onTap: (){
                  deleteLogin();
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginWidget(),
                        ));
                }
              ),
            ],
          ),
        );
  }
}