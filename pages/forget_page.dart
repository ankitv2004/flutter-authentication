import 'package:flutter/material.dart';
import 'package:quiz_app/pages/login_page.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  dynamic errorTextEmail;
  bool isForget = false, clickLogin = false;
  Duration duration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            "Forget your Password",
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints.expand(width: 320, height: 300),
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
                      decoration: InputDecoration(
                          labelText: "Your Password",
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
                        setState(() {
                          if (isForget) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          } else {
                            // ignore: avoid_print
                            print("Not forget");
                          }
                        });
                      },
                      child: const Text(
                        "Forget Password",
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
                        "< Back to Log in",
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
