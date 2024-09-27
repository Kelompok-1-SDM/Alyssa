import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Schedule'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'), // Your profile image
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Calendar Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: '',
              },
              calendarStyle: CalendarStyle(
                markersMaxCount: 1,
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(day, DateTime.now());
              },
            ),
          ),
          // Task Section
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskCard(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Belum ada tugas lain",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.orangeAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tugas yang sedang berlangsung',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Pemateri Seminar Teknologi Informasi',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Auditorium Lt. 8 Teknik Sipil',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/person1.png'), // Replace with your image
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/person2.png'), // Replace with your image
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/person3.png'), // Replace with your image
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
