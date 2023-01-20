import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: const [
              Text(
                'Underground Street',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'We are driven',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
