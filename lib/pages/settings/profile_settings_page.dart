import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../components/rounded_button.dart';
import '../../controllers/settings/change_profile_photo.dart';
import '../../controllers/user/user_controller.dart';

class ProfileSettingsPage extends StatelessWidget {
  static const String id = 'profile_settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sua conta',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<UserController>(
        builder: (context, userController, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(userController.imageURI)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  child: Column(
                    children: [
                      Text(
                        userController.userName,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        userController.userEmail,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: RoundedButton(
                    label: 'Alterar a foto de perfil',
                    enabledColor: Theme.of(context).backgroundColor,
                    splashColor: Theme.of(context).scaffoldBackgroundColor,
                    isEnabled: userController.type == 'Email',
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        backgroundColor: Theme.of(context).backgroundColor,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    changeProfilePhotoFromGallery(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      FlutterIcons.image_outline_mco,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      'Escolher da galeria',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    changeProfilePhotoFromCamera(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      FlutterIcons.camera_outline_mco,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      'Tirar foto',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      FlutterIcons.cancel_mco,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    title: Text(
                                      'Cancelar',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                RoundedButton(
                  label: 'Sair',
                  enabledColor: Theme.of(context).primaryColor,
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.8),
                  isEnabled: true,
                  onTap: () {
                    userController.signOutUser(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
