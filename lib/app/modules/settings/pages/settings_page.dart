import 'package:WolfBeat/core/helpers/assets_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/view_model/user/user_view_model.dart';
import 'profile_settings_page.dart';

class SettingsPage extends StatelessWidget {
  static const String id = 'settings_page';

  @override
  Widget build(BuildContext context) {
    final _userViewModel = GetIt.I.get<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configurações',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
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
            Observer(builder: (context) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ProfileSettingsPage.id);
                },
                leading: FadeInImage.assetNetwork(
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                  placeholder: AssetsHelper.artworkFallback,
                  image: _userViewModel?.imageURI ?? '',
                ),
                title: Text(
                  _userViewModel?.userName ?? 'Obtendo dados...',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    _userViewModel.signOutUser(context);
                  },
                  child: Icon(
                    FlutterIcons.log_out_fea,
                    color: Colors.white,
                  ),
                ),
              );
            }),
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
      ),
    );
  }
}
