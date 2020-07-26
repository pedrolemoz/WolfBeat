import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../controllers/user/user_controller.dart';
import 'profile_settings_page.dart';

class SettingsPage extends StatelessWidget {
  static const String id = 'settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configurações',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<UserController>(
        builder: (context, userController, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Sua conta',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileSettingsPage.id);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userController.imageURI),
                  ),
                  title: Text(
                    userController.userName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      userController.signOutUser(context);
                    },
                    child: Icon(
                      FlutterIcons.log_out_fea,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Sobre',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  'Versão pré-alpha',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
