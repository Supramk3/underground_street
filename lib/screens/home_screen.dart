import 'package:flutter/material.dart';
import 'package:underground_street/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body:
          // body: Container(
          //   child: CustomPaint(

          //   ),
          // ),
          Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/s13_drifting.jpg',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(140.0, 250.0, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/underground_logo_2.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                'Underground Street',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                child: Text(
                  'Customize your car, find local car meets, or checkout car community rides',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.black,
              ),
              child: Text('Continue to the underground'),
            ),
          )
        ],
      ),
    );
  }
}
