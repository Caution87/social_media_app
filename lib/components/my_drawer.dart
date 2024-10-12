import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_drawer_tile.dart';
import 'package:my_social_media_app/pages/profile_page.dart';
import 'package:my_social_media_app/pages/settings_page.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';

/*
-HOME
-PROFILE
-SEARCH
-SETTINGS
-LOGOUT
*/
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  //access auth service
  final _auth = AuthService();
  //logout
  void logout() {
    _auth.logout();
    //this _auth.logout was created by is in AuthService class
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            //app logo
            Icon(
              Icons.person,
              color: Colors.black,
              size: 72,
            ),
            Divider(),
            //home list tile
            MyDrawerTile(
                title: 'HOME',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                }),
            //profile
            MyDrawerTile(
                title: 'PROFILE',
                icon: Icons.person,
                onTap: () {
                  //pop drawer
                  Navigator.pop(context);
                  //go to profile page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(uid: _auth.getCurrentUid())));
                }),
            //search
            MyDrawerTile(title: 'SEARCH', icon: Icons.search, onTap: () {}),
            //settings
            MyDrawerTile(
                title: 'SETTINGS',
                icon: Icons.settings,
                onTap: () {
                  //pop the drawer
                  Navigator.pop(context);
                  //go to settings page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                }),

            //logout
            MyDrawerTile(title: 'LOGOUT', icon: Icons.logout, onTap: logout),
          ],
        ),
      ),
    );
  }
}
