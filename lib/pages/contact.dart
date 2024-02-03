import 'package:flutter/material.dart';
import 'package:needapp/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 116, 48),
        title: Text(
          'Contact',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: const Text('Get in touch',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10.0),
              const Text(
                  "We're always here for you. Do not hesitate to contact us :)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal)),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: () async {
                  String telephoneNumber = '+905332104050';
                  String telephoneUrl = "tel:$telephoneNumber";
                  if (await canLaunchUrl(Uri.parse(telephoneUrl))) {
                    await launchUrl(Uri.parse(telephoneUrl));
                  } else {
                    throw "Error";
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.phone, color: Colors.green),
                    SizedBox(width: 20.0),
                    Text('Call Us',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () async {
                  String telephoneNumber = '+2347012345678';
                  String smsUrl = "sms:$telephoneNumber";
                  if (await canLaunchUrl(Uri.parse(smsUrl))) {
                      await launchUrl(Uri.parse(smsUrl));
                  } else {
                      throw "Error occurred trying to send a message to that number.";
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.sms, color: Colors.green),
                    SizedBox(width: 20.0),
                    Text('Text Us',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),

              SizedBox(height: 15),
              TextButton(
                onPressed: () async {
                  String email = 'atbastumer@gmail.com';
                  String subject = 'This is a test email';
                  String body = 'Hello from NeedApp';   

                  String emailUrl = "mailto:$email?subject=$subject&body=$body";

                  if (await canLaunchUrl(Uri.parse(emailUrl))) {
                    await launchUrl(Uri.parse(emailUrl));
                  } else {
                    throw "Error occured sending an email";
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.mail, color: Colors.green),
                    SizedBox(width: 20.0),
                    Text('Mail Us',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () async {
                  const url = 'https://www.instagram.com/istinyeunivedu';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.language, color: Colors.green),
                    SizedBox(width: 20.0),
                    Text('Instagram',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
