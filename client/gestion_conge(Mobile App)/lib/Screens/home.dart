
   
import 'package:flutter/material.dart';
import 'package:gestion_conget/Screens/consulter.dart';
import 'package:gestion_conget/Screens/deposer.dart';
import 'package:gestion_conget/Screens/notif.dart';


import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'drawerheader.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

enum DrawerSection{
  deposer,
  Consulter,
  notification,
  deconnection,
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {


   @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Gestion de congé"),
      ),
      body:Column(
          children:[
            Container(
              height: 150,
             width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: DigitalClock(
                  digitAnimationStyle: Curves.elasticOut,
                  is24HourTimeFormat: false,
                  areaDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 60,
                  ),
                  amPmDigitTextStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),              
                ),
              ),
            ),
          ),
             // ignore: avoid_unnecessary_containers
             SingleChildScrollView(
                        // ignore: sized_box_for_whitespace
               child: Container(
                 height: 600,
                 child: SfCalendar(
                    view: CalendarView.week,
                    firstDayOfWeek: 1, // Monday
                    showCurrentTimeIndicator: true,
                        headerHeight: 60,
                      ),
               ),
             ),
          ],
        ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
    );
    }
    
  Widget menuItem(int id, String title, IconData icon) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Deposer()));
            } else if (id == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Consulter()));
            } else if (id == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Notif()));
            } else if (id == 5) {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => Deconnecter()));
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

      Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: <Widget>[
            menuItem(1,"Deposer",Icons.send_rounded),
       menuItem(2,"Consulter",Icons.recent_actors_sharp),
        menuItem(3,"Notifications",Icons.notifications),
        menuItem(4,"Ratrappage",Icons.calendar_today_sharp),
        menuItem(5,"Deconnection",Icons.logout),
        // ignore: sized_box_for_whitespace
        Container(
          margin: const EdgeInsets.only(top: 160),
          alignment: Alignment.bottomCenter,
                width: 100,
                height: 100,
               // color: Colors.amber,
                child: Image.asset("assets/isimm.png"),
        ),


        ],
      ),
    );
  }
  








  

}