import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  dynamic errorTextEmail;
  bool isSignup = false;
  bool clickLogin = false;
  Duration duration = const Duration(seconds: 1);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.toString(), password: _password.text.toString());
      isSignup = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-passweord") {
        //
      } else if (e.code == "email-already-in-use") {
        //
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            "Sign Up",
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
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Your name",
                          labelStyle: const TextStyle(fontSize: 18),
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(Icons.person_rounded)),
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.name,
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
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        createUserWithEmailAndPassword();
                        setState(() {
                          if (isSignup) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            const Dialog(
                              child: Text("Alert!"),
                            );
                          }
                        });
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          clickLogin = true;
                          if (duration.inMilliseconds > 500) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          }
                        });
                      },
                      child: Text(
                        "Already have an account? Log in",
                        style: TextStyle(
                            color: clickLogin ? Colors.orange : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: clickLogin
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
