import 'package:flutter/material.dart';

import 'package:notes_app/services/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Text(
                'Create and Manage Your Notes',
                style: TextStyle(
                  fontFamily: 'Architects Daughter',
                  fontSize: 36.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                  onPressed: () async{
                    signInWithGoogle(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Image.asset(
                        'assets/images/google.png',
                        height: 36.0,
                      )
                    ],
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[700],),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0))
                ),
              ),
            ),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }
}
