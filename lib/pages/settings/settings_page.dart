import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/20285104?s=460&u=2a6da1d424744c4ca8d34d54499cfc86ea022a13&v=4',
                ),
              ),
              title: Text(
                'Pedro Lemos',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              trailing: GestureDetector(
                onTap: () {},
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
      ),
    );
  }
}
