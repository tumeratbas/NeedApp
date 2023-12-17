import 'package:flutter/material.dart';
import 'package:needApp/pages/intro_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginScreen(),
    ),
  );
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 170, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 178, 166, 237),
        elevation: 40,
        title:
        Text('Welcome')
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              cursorColor: Color.fromRGBO(255, 255, 255, 1),
              decoration: InputDecoration(
                iconColor: Color.fromRGBO(255, 255, 255, 1),
                labelText: 'Username',
                icon: Icon(Icons.person),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                iconColor: Colors.white,
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_isLoginValid()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Invalid username or password.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  usernameController.clear();
                  passwordController.clear();
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
  bool _isLoginValid() {
    const String validUsername = 'tumer';
    const String validPassword = 'sifre';

    return usernameController.text == validUsername &&
        passwordController.text == validPassword;
  }
}

