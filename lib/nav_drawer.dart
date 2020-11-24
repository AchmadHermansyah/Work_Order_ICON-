import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.account_circle,
              text: 'Profil',
              onTap: () => print('Tap Profil menu')),
          _drawerItem(
              icon: Icons.help_outline,
              text: 'Bantuan',
              onTap: () => print('Tap Bantuan')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.logout,
              text: 'Keluar',
              onTap: () => Navigator.pushReplacementNamed(context, '/')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover),
    ),
    otherAccountsPictures: [
      ClipOval(
        child:
            Image(image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover),
      ),
      ClipOval(
        child:
            Image(image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover),
      )
    ],
    accountName: Text('Aplikasi Work Order AMC'),
    accountEmail: Text('test@mail.com'),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
