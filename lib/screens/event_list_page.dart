// screens/event_list_page.dart

import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final List<Map<String, dynamic>> _eventList = [
    {'id': 'event1', 'name': 'Event 1', 'startDate': DateTime.now()},
    {'id': 'event2', 'name': 'Event 2', 'startDate': DateTime.now().add(Duration(days: 7))},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: ListView.builder(
        itemCount: _eventList.length,
        itemBuilder: (context, index) {
          var event = _eventList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(event['name']),
              subtitle: Text('Start Date: ${event['startDate'].toString()}'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/candidates',
                  arguments: event['id'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}