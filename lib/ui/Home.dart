import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:mytsa/data/Data.dart';
import 'package:mytsa/ui/Login.dart';
import 'package:mytsa/ui/Settings.dart';
import 'package:mytsa/ui/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0;
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.book,
    FontAwesomeIcons.bookBookmark,
    FontAwesomeIcons.gear,
  ];
  // int devWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
    _isAndroidPermissionGranted();
    _requestPermissions();
  }

  bool _notificationsEnabled = false;
  GlobalKey<SliderDrawerState> _drawer = GlobalKey<SliderDrawerState>();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      setState(() {
        _notificationsEnabled = granted ?? false;
      });
    }
  }

  Future<void> _showLinuxNotificationWithCriticalUrgency() async {
    const LinuxNotificationDetails linuxPlatformChannelSpecifics =
        LinuxNotificationDetails(
      urgency: LinuxNotificationUrgency.critical,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      linux: linuxPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'notification with critical urgency',
      null,
      platformChannelSpecifics,
    );
  }

  Future<void> _showNotificationWithNoBody() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', null, platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    var devheight = MediaQuery.of(context).size.height;
    late List lanjutMateri = Data().lanjutMateri;
    late List popularMateri = Data().popularMateri;
    late String theme = "";
    late bool switchVal = Get.isDarkMode == true;
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).backgroundColor;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: AutoSizeText(
              //     "brightness $index",
              //     maxLines: 1,
              //     style: TextStyle(color: color),
              //     group: autoSizeGroup,
              //   ),
              // )
            ],
          );
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        activeIndex: _bottomNavIndex,
        // splashColor: HexColor('#FFA400'),
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        // shadow: BoxShadow(
        //   offset: Offset(0, 1),
        //   blurRadius: 12,
        //   spreadRadius: 0.5,
        //   color: HexColor('#FFA400'),
        // ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: DefaultTextStyle(
        style: TextStyle(fontFamily: "Poppins"),
        child: SliderDrawer(
          key: _drawer,
          appBar: SliderAppBar(
            drawerIconColor: Colors.grey,
            // drawerIconColor: Theme.of(context).colorScheme.primary,
            appBarColor: Theme.of(context).scaffoldBackgroundColor,
            // appBarPadding: EdgeInsets.only(right: ),
            title: Text(
              "MyDigi",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.bold),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(FontAwesomeIcons.magnifyingGlass,
                  color: Get.isDarkMode ? Colors.white : Colors.grey[700],
                  size: 25),
            ),
            isTitleCenter: true,
          ),
          slider: Container(
              child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                // Container(
                //   child: Image.asset(
                //     "assets/images/logo.png",
                //     height: MediaQuery.of(context).size.height / 5,
                //     width: MediaQuery.of(context).size.width / 5,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("MyDigi",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 5,
                ),
                
                ListTile(
                    title: Text("Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 15)),
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                    }),
                ListTile(
                    title: Text("Settings",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 15)),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ));
                    }),
                Divider(),
                ListTile(
                    title: Text("Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 15)),
                    onTap: () {
                      // deleteLogin();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginWidget(),
                          ));
                    }),
                // ListTile(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => Settings(),
                //         ));
                //   },
                //   leading: Icon(Icons.settings),
                //   title: Text("Settings",
                //       style:
                //           TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15)),
                // ),
              ],
            ),
          )),
          child: Container(
            height: devheight,
            child: ListView(
              controller: ScrollController(),
              // key: ,
              addSemanticIndexes: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: devheight / 20, left: 10, top: devheight / 20),
                  child: Text("Lanjutkan Materi",
                      style: TextStyle(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 17)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: devheight / 3,
                  child: ListView.builder(
                      controller: ScrollController(),
                      addSemanticIndexes: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: lanjutMateri == null ? 0 : lanjutMateri.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Container(
                              width: devWidth / 2,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   child: Container(
                                  //       decoration: ShapeDecoration(
                                  //         shape: CircleBorder(),
                                  //         color:
                                  //             Theme.of(context).colorScheme.primary,
                                  //       ),
                                  //       width: 30,
                                  //       height: 30),
                                  // ),
                                  Center(
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text(lanjutMateri[index]["nama"],
                                            style: TextStyle(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 13))),
                                  ),
                                  Positioned(
                                    top: devheight / 5,
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text(
                                            "-+" +
                                                lanjutMateri[index]["durasi"],
                                            style: TextStyle(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 10))),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: devheight / 4,
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text("Lihat selengkapnya..",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 9))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: devheight / 20, left: 10, top: devheight / 20),
                  child: Text("Materi populer",
                      style: TextStyle(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 17)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: devheight / 3,
                  child: ListView.builder(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          popularMateri == null ? 0 : popularMateri.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Container(
                              width: devWidth / 2,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   child: Container(
                                  //       decoration: ShapeDecoration(
                                  //         shape: CircleBorder(),
                                  //         color:
                                  //             Theme.of(context).colorScheme.primary,
                                  //       ),
                                  //       width: 30,
                                  //       height: 30),
                                  // ),
                                  Center(
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text(
                                            popularMateri[index]["nama"],
                                            style: TextStyle(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 13))),
                                  ),
                                  Positioned(
                                    top: devheight / 5,
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text(
                                            "-+" +
                                                popularMateri[index]["durasi"],
                                            style: TextStyle(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 10))),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: devheight / 4,
                                    child: Container(
                                        // width:devheight/4,
                                        // height: devheight/18,
                                        child: Text("Lihat selengkapnya..",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 9))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
