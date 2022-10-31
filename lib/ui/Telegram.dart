import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytsa/Models/UserModel.dart';
import 'package:mytsa/ui/Drawer.dart';
import 'package:mytsa/ui/Settings.dart';
import 'package:mytsa/ui/signup.dart';

class Telegram extends StatefulWidget {
  Telegram({Key? key}) : super(key: key);

  @override
  _TelegramState createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  @override
  Widget build(BuildContext context) {
    var devSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dots"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),

        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Text(items[index].name),
                  Icon(
                    FontAwesomeIcons.checkDouble,
                    color: Colors.green,
                    size: 10,
                  )
                ],
              ),
              subtitle: Text(items[index].message),
              trailing: Text(items[index].time),
              leading: CircleAvatar(),
            );
          },
          itemCount: items == null ? 0 : items.length,
        ),
        // body: Padding(
        //   padding: EdgeInsets.only(
        //     top: MediaQuery.of(context).size.width / 3,
        //     left: MediaQuery.of(context).size.width / 3,
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         width: 50,
        //         height: 50,
        //         decoration: BoxDecoration(
        //             color: Colors.redAccent, shape: BoxShape.circle),
        //       ),
        //       Container(
        //         width: 50,
        //         height: 50,
        //         decoration: BoxDecoration(
        //             color: Colors.pinkAccent, shape: BoxShape.circle),
        //       ),
        //       Row(
        //         children: [
        //           Container(
        //             width: 50,
        //             height: 50,
        //             decoration: BoxDecoration(
        //                 color: Colors.blueAccent, shape: BoxShape.circle),
        //           ),
        //           Container(
        //             width: 50,
        //             height: 50,
        //             decoration: BoxDecoration(
        //                 color: Colors.pinkAccent, shape: BoxShape.circle),
        //           ),
        //           Container(
        //             width: 50,
        //             height: 50,
        //             decoration: BoxDecoration(
        //                 color: Colors.redAccent, shape: BoxShape.circle),
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          //  backgroundColor: Co,
          child: Icon(Icons.add, color: Colors.white),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}

// class DrawerListTile extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

// }