import 'package:flutter/material.dart';

import '../../../core/exceptions/null_attribute_exception.dart';

/// [RoundedButton] is a widget that create a customized button.
/// It's a Ink with a BoxDecoration and a InkWell inside.
/// Used in [SignInPage], [SignInWithEmailAndPasswordPage], [SignUpPage],
/// [SignUpWithEmailAndPasswordPage], [WelcomePage], [ProfileSettingsPage].
class RoundedButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color enabledColor;
  final Color borderColor;
  final Color splashColor;
  final Color textColor;
  final bool isEnabled;
  final List<Color> gradient;
  final Icon icon;

  RoundedButton({
    @required this.label,
    @required this.onTap,
    this.isEnabled,
    this.enabledColor,
    this.borderColor,
    this.splashColor,
    this.textColor,
    this.gradient,
    this.icon,
  })  : assert(label != null, throw NullAttributeException('label')),
        assert(onTap != null, throw NullAttributeException('onTap'));

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: isEnabled && gradient == null
            ? enabledColor
            : borderColor == null && gradient == null
                ? Color(0xFF817B7B)
                : null,
        gradient: gradient != null
            ? LinearGradient(
                colors: gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        border: borderColor != null
            ? Border.all(
                width: 1.0,
                color: isEnabled ? Colors.white : Color(0xFF8F8F8F),
              )
            : null,
      ),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(5.0),
        splashColor: splashColor,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: icon != null
                ? Text(
                    label,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textColor ?? null,
                        ),
                  )
                : Text(
                    label,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textColor ?? null,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
