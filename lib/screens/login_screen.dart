import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:underground_street/screens/main_home_screen.dart';
import 'package:underground_street/screens/registration_screen.dart';
import 'package:underground_street/widgets/custom_button.dart';
import 'package:underground_street/widgets/validated_textform_field.dart';

import '../authentication/auth.dart';

class LoginPage extends StatefulWidget {
  // Future<void> signOut() async {
  //   await Auth().signOut();
  // }

  // Widget _userUid() {
  //   return Text(user?.email ?? 'UserEmail');
  // }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool _hideText = true;
    _toggleHiddenText() {
      setState(() {
        _hideText = !_hideText;
      });
    }

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/underground_logo_2.png'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Underground Street',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'We are driven',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                ValidatedTextFormField(
                  controller: _controllerEmail,
                  hintText: 'Email',
                  labelText: 'Email',
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                ValidatedTextFormField(
                  controller: _controllerPassword,
                  hintText: 'Password',
                  labelText: 'Password',
                  enablePasswordEyeIcon: true,
                  enablePasswordHideText: _hideText,
                  // passwordEyeOnPressed: _toggleHiddenText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'password must be 6 characters more';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      fixedSize: const MaterialStatePropertyAll(Size(300, 40)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    label: const Text('Continue'),
                    onPressed: () async {
                      try {
                        if (formkey.currentState!.validate()) {
                          await authService.signWithEmailAndPassword(
                              _controllerEmail.text, _controllerPassword.text);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainHomePage()));
                          errorMessage = '';
                        }
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                      }
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_back_sharp),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      height: 36.0,
                      child: const Divider(
                        color: Colors.black,
                      ),
                    )),
                    const Text('OR'),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ],
                ),
                CustomButton(
                    color: Colors.white,
                    borderRadius: 18.0,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/google-logo.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                    color: Colors.white,
                    borderRadius: 18.0,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.apple,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in with Apple',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
                // CustomButton(
                //     color: Colors.white,
                //     borderRadius: 18.0,
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => RegisterScreen()));
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: const [
                //         CircleAvatar(
                //           radius: 10,
                //           backgroundColor: Colors.white,
                //           child: Icon(
                //             Icons.account_box,
                //             color: Colors.black,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 10.0,
                //         ),
                //         Text(
                //           'Sign up for account',
                //           style: TextStyle(color: Colors.black),
                //         ),
                //       ],
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
