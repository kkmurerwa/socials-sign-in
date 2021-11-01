import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double imageLoginHeight = 60;

    void loginWithGoogle() async {
      print("Logging in with Google");

      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'openid',
          'profile'
        ],
      );

      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      print("SIGN IN ACCOUNT: ${googleSignInAccount!.toString()}");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page"
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              child: Container(
                height: imageLoginHeight,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "assets/images/png-apple-logo.png",
                          color: Colors.white
                        )
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Sign in with Apple",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                // Do stuff
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Container(
                height: imageLoginHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "assets/images/png-google-logo.png",
                        )
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                loginWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
