import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: _launcherURL,
          child: Text("拨打电话"),
        ),
      ),
    );
  }

  void _launcherURL() async {
    String url = 'tel:13776356351';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
