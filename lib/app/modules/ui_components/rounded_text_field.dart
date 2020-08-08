import 'package:flutter/material.dart';

/// [RoundedTextField] is a widget that create a customized TextField.
/// It's a Textfield.
/// Used in [SignInWithEmailAndPasswordPage], [SignUpWithEmailAndPasswordPage]
/// and in [SearchPage].
class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    @required this.textController,
    @required this.hintText,
    @required this.onChanged,
    this.onIconTap,
    this.icon,
    this.keyboardType,
    this.padding = EdgeInsets.zero,
    this.obscureText = false,
  });

  final TextEditingController textController;
  final String hintText;
  final Icon icon;
  final Function onIconTap;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function onChanged;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      textAlign: TextAlign.center,
      showCursor: false,
      maxLines: 1,
      autocorrect: true,
      obscureText: obscureText,
      cursorColor: Theme.of(context).primaryColor,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
      decoration: InputDecoration(
        contentPadding: padding,
        suffixIcon: icon != null
            ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                color: Theme.of(context).scaffoldBackgroundColor,
                icon: icon,
                iconSize: 30.0,
                onPressed: () {
                  onIconTap();
                  print(textController.text);
                },
              )
            : null,
        filled: true,
        fillColor: Color(0xFFF0F0F5),
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      onChanged: (input) {
        onChanged();
        print(textController.text);
      },
    );
  }
}
