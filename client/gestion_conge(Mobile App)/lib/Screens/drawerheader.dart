import 'package:flutter/material.dart';
class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}



String name="Adem"; 

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blue,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(top:50.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         const CircleAvatar(
           radius: 50,
           backgroundColor: Color.fromARGB(255, 1, 91, 165),
           child:Icon(

             Icons.person,
             color: Colors.white,
             size: 50,
           ),
         ),
         const SizedBox(height: 20,),
          Container(
            margin:const EdgeInsets.only(bottom: 10.0),
            height:70,
            child: Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            ),
            ),

        ],
      )
    );
  }
}