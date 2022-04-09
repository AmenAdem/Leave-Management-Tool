import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {

  static const IconData zzz = IconData(0xf8ae);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: const Text("Notifications"),
      ),
      body:Center(
        child: Container(
          padding: const EdgeInsets.all(80),
          child: Column(
          
          children: const [
           Icon(Icons.notifications_off,
            size: 80,
            color: Colors.grey,),
            SizedBox(
              height: 20,
            ),
            Text("Pas de notification \n pour le moment !!",
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey
            ),)
          ],
        ),),
      )
    );
  }
}