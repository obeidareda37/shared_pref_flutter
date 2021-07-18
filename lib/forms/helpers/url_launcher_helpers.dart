import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();

  static UrlLauncherHelper _urlLauncherHelper = UrlLauncherHelper._();

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  openWebPage() {
    try {
      _launchURL('https://flutter.dev');
    } catch (e) {
      print(e);
    }
  }

  makeCall() {
    try {
      _launchURL('tel:+1 555 010 999');
    } catch (e) {
      print(e);
    }
  }

  sendSms() {
    try {
      _launchURL('sms:5550101234');
    } catch (e) {
      print(e);
    }
  }

  senEmail() {
    try {
      _launchURL('mailto:smith@example.org?subject=News&body=New%20plugin');
    } catch (e) {
      print(e);
    }
  }

  sendWhatsapp(){
    try {
      _launchURL('https://wa.me/15551234567');
    } catch (e) {
      print(e);
    }
  }
  sendInstagrm(){
    try {
      _launchURL('https://wa.me/15551234567');
    } catch (e) {
      print(e);
    }
  }
}
