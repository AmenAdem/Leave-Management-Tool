import 'package:flutter/material.dart';
import 'package:gestion_conget/Screens/home.dart';
class AuthentificationScreen extends StatelessWidget {

  static const routeName = '/authentification-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: userInput,
          decoration: InputDecoration(
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text('Se Connecter ',
              style: TextStyle(
                color:Colors.indigo.shade800,
                fontSize: 30)
                ),
          Container(
            height: 510,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 45),
                  userInput(emailController, 'Email', TextInputType.emailAddress),
                  userInput(passwordController, 'Mote de passe', TextInputType.visiblePassword),
              Container(
                height: 55,
                // for an exact replicate, remove the padding.
                // pour une réplique exact, enlever le padding.
                padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.indigo.shade800,
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const Home();}));
                  },
                  child: const Text('se connecter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                  ),
                ),
                  const SizedBox(height: 20),
                  const Center(child: Text('Mot de passe oublié ?'),),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                      ],
                    ),
                  ),
                  const Divider(thickness: 0, color: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Vous n \'avez pas de compte ?', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Inscrivez-vous',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            ),
          ),
              ],
          ),
        ),
      ),
    );
  }
}
