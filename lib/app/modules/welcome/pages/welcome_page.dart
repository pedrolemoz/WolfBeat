import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/assets_helper.dart';
import '../../auth/pages/sign_in/sign_in_page.dart';
import '../../auth/pages/sign_up/sign_up_page.dart';
import '../../bottom_navigation/pages/bottom_navigation_bar.dart';
import '../../ui_components/rounded_button.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome_page';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkUserAuth(context);
  }

  Future<void> checkUserAuth(BuildContext context) async {
    var _auth = FirebaseAuth.instance;
    var _user = await _auth.currentUser();

    if (_user != null) {
      await Navigator.pushNamedAndRemoveUntil(
        context,
        BottomNavigator.id,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Hero(
                    tag: 'Logo',
                    child: Image.asset(
                      AssetsHelper.wolfBeatLogo,
                      height: 180.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Hero(
                      tag: 'WolfBeat',
                      child: Text(
                        'WolfBeat',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'Description',
                    child: Text(
                      'Músicas que inspiram sua vida',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: RoundedButton(
                      label: 'Fazer login',
                      onTap: () => Navigator.pushNamed(context, SignInPage.id),
                      enabledColor: Theme.of(context).primaryColor,
                      isEnabled: true,
                    ),
                  ),
                  RoundedButton(
                    label: 'Cadastrar-se',
                    onTap: () => Navigator.pushNamed(context, SignUpPage.id),
                    borderColor: Colors.white,
                    isEnabled: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
