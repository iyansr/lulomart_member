import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileListView extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  ProfileListView({@required this.onTap, @required this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
    );
  }
}
