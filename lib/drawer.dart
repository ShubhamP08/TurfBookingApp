import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

import 'authcontroller.dart';

class MyDrawer extends StatelessWidget {
  Widget listTile(
      {IconData? icon, String? title, required Null Function() OnTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: Colors.green[100],
        child: ListView(children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent[100],
                    backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/147/147142.png"),radius: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome, abc",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () => AuthController.instance.logout(),
                          child: Text("SignOut"),
                          style:
                              TextButton.styleFrom(minimumSize: Size(60, 40))),
                    ),
                  ],
                )
              ],
            ),
          ),
          listTile(icon: Icons.home_outlined, title: "Home", OnTap: () {}),
          listTile(
            icon: Icons.location_on,
            title: "All Locations",
            OnTap: () {},
          ),
          listTile(
            icon: Icons.apartment,
            title: "All Centers",
            OnTap: () {},
          ),
          listTile(
            icon: Icons.person,
            title: "My Profile",
            OnTap: () {},
          ),
          listTile(
            icon: Icons.info,
            title: "About Us",
            OnTap: () {},
          ),
          // listTile(
          //   icon: Icons.logout,
          //   title: "Logout",
          //   OnTap: () {
          //     AuthController.instance.logout();
          //   },
          // ),
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Contact Support"),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Call us: "),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+91 1234567890")
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Mail us: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text("abc@abc.com")
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
