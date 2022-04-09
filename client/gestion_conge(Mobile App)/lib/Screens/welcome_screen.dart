import 'package:flutter/material.dart';
import './authentification_screen.dart';

class WelcomeScreen extends StatelessWidget {

  static const routeName = '/welcome-screen';

  Widget authentificationButton(Color buttonColor, String title, Color textColor, BuildContext ctx) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
            return AuthentificationScreen();
          }));
        },
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(

              image: DecorationImage(

                  image:AssetImage("assets/last.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: const [
                      Text('Bienvenue,', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),
                ),),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    authentificationButton(const Color.fromARGB(255, 75, 90, 179), 'Se Connecter', Colors.white, context),
                    authentificationButton(Colors.white, "S'inscrire", Colors.lightBlue, context),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
