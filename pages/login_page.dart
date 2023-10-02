import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/forget_page.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;
  dynamic errorTextEmail;
  bool clickSignup = false, clickForget = false;
  Duration duration = const Duration(seconds: 1);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.toString(), password: _password.text.toString());
      isLogin = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        //
      } else if (e.code == "wrong-password") {
        //
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            "Login with account",
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints.expand(width: 320, height: 380),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: const TextStyle(fontSize: 18),
                          hintText: "Your email Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(Icons.email_rounded),
                          errorText: errorTextEmail),
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(fontSize: 18),
                          hintText: "Enter strong Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(Icons.security_rounded)),
                      obscureText: true,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              clickForget = true;
                              if (duration.inMilliseconds > 500) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPage()));
                              }
                            });
                          },
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                              color: clickForget
                                  ? Colors.orange
                                  : Colors.blue.shade800,
                              decoration: clickForget
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signInWithEmailAndPassword();
                        setState(() {
                          if (isLogin) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            //
                          }
                        });
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          clickSignup = true;
                          if (duration.inMilliseconds > 500) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          }
                        });
                      },
                      child: Text(
                        "Need an account? Sign Up",
                        style: TextStyle(
                            color: clickSignup ? Colors.orange : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: clickSignup
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontFamily: "georgia"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
