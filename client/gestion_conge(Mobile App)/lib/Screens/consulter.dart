import 'package:flutter/material.dart';
import 'data.dart';

class Consulter extends StatefulWidget {
  const Consulter({Key? key}) : super(key: key);

  @override
  State<Consulter> createState() => _ConsulterState();
}

class _ConsulterState extends State<Consulter> {
  //Icon a = Icon(Icons.abc);
  var getdata=ReqData.getData;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulter les demandes "),
      ),
      body: Column(
        children: [
          Container(
   padding: const EdgeInsets.fromLTRB(10,10,10,0),
   height: 160,
   width: double.maxFinite,
   child: Card(
     elevation: 5,
     child: Padding(
           padding: const EdgeInsets.all(7),
           child: Stack(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     margin: const EdgeInsets.all(10),
                    // padding: EdgeInsets.only(right:100),
                     child: Column(
                       children: [
                         const Text("TYPE : CONGE DE MALADIE" ,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight:FontWeight.bold
                         ),),
                     const SizedBox(
                       height: 50,
                     ),
                         Container(
                           padding: const EdgeInsets.only(top:10),
                        
                           alignment: Alignment.bottomLeft,
                           child: const Text("01/01/2021",
                           style: TextStyle(
                           fontSize: 20,
                           fontWeight:FontWeight.bold)
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Container(
                     alignment: Alignment.centerRight,
                     child: const Icon(Icons.done_all_outlined,
                    
                     color:Colors.green,
                     size: 50,),
                   )
                 ],
               )
             ],
           ),),
             ),
           ),
Container(
   padding: const EdgeInsets.fromLTRB(10,10,10,0),
   height: 160,
   width: double.maxFinite,
   child: Card(
     elevation: 5,
     child: Padding(
           padding: const EdgeInsets.all(7),
           child: Stack(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     margin: const EdgeInsets.all(10),
                    // padding: EdgeInsets.only(right:100),
                     child: Column(
                       children: [
                         const Text("TYPE : CONGE SANS SOLDE" ,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight:FontWeight.bold
                         ),),
                     const SizedBox(
                       height: 50,
                     ),
                         Container(
                           padding: const EdgeInsets.only(top:10),
                        
                           alignment: Alignment.bottomLeft,
                           child: const Text("11/3/2020",
                           style: TextStyle(
                           fontSize: 20,
                           fontWeight:FontWeight.bold)
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Container(
                     alignment: Alignment.centerRight,
                     child: const Icon(Icons.close,   //done_all_outlined,
                    
                     color:Colors.red,
                     size: 50,),
                   )
                 ],
               )
             ],
           ),),
             ),
           ),





        ],
      ),
    );

  }
}