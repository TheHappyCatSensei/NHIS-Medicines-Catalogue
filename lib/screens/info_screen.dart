import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:mailto/mailto.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  Future openEmail({
    required String emailTo,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$emailTo?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'cannot open mail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'DISCLAIMER',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: Colors.red[600],
                  ),
                ),
                Text(
                  'This application is not affiliated to nor created by the Ghana Health Service. This application is free and thus, does not require any purchase for its usage. The information here is simply to inform the Ghanaian public on the various medicines covered under the National Health Insurance Scheme in Ghana',
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Text(
                  'Powered and Developed by',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/guildbytes.png',
                  scale: 5,
                ),
                Text(
                  'GUILDBYTES\nTECH SOLUTIONS',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Linkify(
                    text: 'Website: https://www.guildbytes.com',
                  ),
                  onTap: () async {
                    if (await canLaunch('https://www.guildbytes.com')) {
                      await launch(
                        'https://www.guildbytes.com',
                        forceWebView: false,
                        enableJavaScript: true,
                        forceSafariVC: false,
                      );
                    } else {
                      throw 'cannot open https://www.guildbytes.com';
                    }
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Linkify(
                    text: 'Email: guildbytes@gmail.com',
                  ),
                  onTap: () async {
                    openEmail(
                      emailTo: 'guildbytes@gmail.com',
                      subject: 'Let us do business',
                      body: 'Hello',
                    );
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Linkify(text: 'Phone/Whatsapp: +233 55-451-7849'),
                  onTap: () async {
                    if (await canLaunch('tel:+233 55-451-7849')) {
                      await launch('tel:+233 55-451-7849');
                    } else {
                      throw 'cannot open phone';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
