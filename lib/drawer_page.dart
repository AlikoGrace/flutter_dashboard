import 'package:dashboard/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  String title;
  IconData icon;
  ButtonsInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: 'Home', icon: Icons.home),
  ButtonsInfo(title: 'Settings', icon: Icons.settings),
  ButtonsInfo(title: 'Notifications', icon: Icons.notifications),
  ButtonsInfo(title: 'Contacts', icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: 'Sales', icon: Icons.sell),
  ButtonsInfo(title: 'Marketing', icon: Icons.mark_email_read),
  ButtonsInfo(title: 'Security', icon: Icons.verified_user),
  ButtonsInfo(title: 'Users', icon: Icons.supervised_user_circle_rounded),
]; //singleChildScrollView is best over listView when building
//different widgets with diff sizes in a list

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Admin Menu',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
              ),
              ...List.generate(
                //Creates a list with length positions and fills it with values created by calling
                // generator for each index in the range 0 .
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      //the index here is from listTile
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                kRedDark.withOpacity(0.9),
                                kOrangeDark.withOpacity(0.9)
                              ]))
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    )
                  ],
                ),
              ),

              //the 3dots tell flutter this will be a multiple
              //widget inside the container
            ],
          ),
        ),
      ),
    );
  }
}
