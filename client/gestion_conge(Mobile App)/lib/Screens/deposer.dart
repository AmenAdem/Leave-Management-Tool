
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_conget/Screens/home.dart';
import 'package:intl/intl.dart';

class Deposer extends StatefulWidget {
  @override
  State<Deposer> createState() => _DeposerState();
}

class _DeposerState extends State<Deposer> {
  String file_name="";
 String _dropdownValue = "CONGÉ PAYÉ";
  List<String> dropDownOptions = [
    "CONGÉ PAYÉ",
    "CONGÉ SANS SOLDE",
    "CONGÉ ANNUEL",
    "CONGÉ MALADIE",
    "Autre"
  ];
         late DateTimeRange dateRange= DateTimeRange(
      start: DateTime.now(),

      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );




Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Demande envoyée avec succès'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       
        DecoratedBox(
            child:  Container(
             // padding: EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: const Icon(Icons.done,
          size: 50,
          color: Colors.white,
          ),
        ),
          decoration:const BoxDecoration(

            color: Colors.green,
            shape: BoxShape.circle,
          ))
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Fermer'),
      ),
    ],
  );
}

 void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }


  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange.end);
    }
  }




  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposer une demande de Congé"),
      ),
      body: SingleChildScrollView(
        //child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10,20,10,0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text("Type de Congé : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic
                      )
                      ,),
                      const SizedBox(
                        width: 10,
                      ),
                      Center(
                        child:  DropdownButton(
                  items: dropDownOptions
                      .map<DropdownMenuItem<String>>((String mascot) {
                    return DropdownMenuItem<String>(
                        child: Text(mascot), value: mascot);
                  }).toList(),
                  focusColor: Colors.blue,
                 // isExpanded: true,
                underline:Container(
                  height: 1,
                  color: Colors.blue,
                ),
                  value: _dropdownValue,
                  onChanged: dropdownCallback,
                  iconSize: 30,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16
                      ),
                        ),
                         ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("Duree : ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic
                          )
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: Colors.grey
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("de  :  ",    
                            style: TextStyle(
                            fontSize: 20,
                          )
                          ),
                          Text(getFrom(),style: const TextStyle(
                            fontSize: 18,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("A  :  ",    
                            style: TextStyle(
                            fontSize: 20,
                          )
                          ),
                          Text(getUntil(),style: const TextStyle(
                            fontSize: 18,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(150,0,150,0),
                    onPressed: (){
                     // _selectDate(context);
                     pickDateRange(context);
                    },
                    child: const Icon(Icons.date_range,
                    color:Colors.white),
                    color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("Cause : ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic

                          )
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                 Container(
                   padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: Colors.grey
                    ),
                   child: const TextField(
                     
             keyboardType: TextInputType.multiline,
               maxLines: null,
               decoration: InputDecoration(
               //labelText: 'Cause',
               hintText: 'Ecrire un message ici \n\n\n'),
               showCursor: true,
                    ),
                 ),
                 const SizedBox(height: 20),
                 Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("Attacher un document : ",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic

                          )
                    )),
                    const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                     decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: Colors.grey,    
                  ),
                  child: Column(
                  
                    children: [
                      Text(file_name,
                      style: const TextStyle(
                        fontSize: 16
                      ),),
                      const SizedBox(height: 10,),
                      FlatButton(
                        onPressed: () async {
                       FilePickerResult? result = await FilePicker.platform.pickFiles( 
                         type: FileType.custom,
                    allowedExtensions: ['jpg', 'pdf', 'doc','png'],);
                      if (result != null) {
                    File file = File(result.files.single.name);
                    setState(() {
                      file_name="Nom de Fichier  : "+result.files.single.name;
                    });
                      } else {
                      // User canceled the picker
                        }
                     },
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(150,0,150,0),
                        color: Colors.blue,
                        child:const Icon(Icons.attach_file,//upload_file,
                        color: Colors.white,
                                   ),
                        ),
                    ],
                  ),
                  ),
                  const SizedBox(
                      height: 20,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    onPressed: (){
                         showDialog(
                           context: context,
                           builder: (BuildContext context) => _buildPopupDialog(context),
                             );
                    },
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.send),
                    ),
                  ),
                ],
                
              ),
            ),
        ),
    );
    
  }
}
