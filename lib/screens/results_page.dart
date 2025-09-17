import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  // Map to store events and their respective candidates and vote counts
  final Map<String, Map<String, int>> _eventVoteCounts = {
    'Event 1': {'Candidate 1': 10, 'Candidate 2': 5},
    'Event 2': {'Candidate A': 15, 'Candidate B': 20},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Voting Results')),
      body: ListView.builder(
        itemCount: _eventVoteCounts.length,
        itemBuilder: (context, eventIndex) {
          // Retrieve event name and its candidates
          final eventName = _eventVoteCounts.keys.toList()[eventIndex];
          final candidates = _eventVoteCounts[eventName]!;

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ExpansionTile(
              title: Text(eventName),
              children: candidates.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text('Votes: ${entry.value}'),
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addEvent",
            onPressed: () async {
              final newEvent = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEventPage()),
              );
              if (newEvent != null) {
                setState(() {
                  _eventVoteCounts[newEvent] = {};
                });
              }
            },
            tooltip: 'Add Event',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: "removeEvent",
            onPressed: () async {
              final removedEvent = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RemoveEventPage(eventVoteCounts: _eventVoteCounts)),
              );
              if (removedEvent != null) {
                setState(() {
                  _eventVoteCounts.remove(removedEvent);
                });
              }
            },
            tooltip: 'Remove Event',
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class AddEventPage extends StatelessWidget {
  final TextEditingController _eventController = TextEditingController();

  AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _eventController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _eventController.text);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoveEventPage extends StatelessWidget {
  final Map<String, Map<String, int>> eventVoteCounts;
  const RemoveEventPage({super.key, required this.eventVoteCounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remove Event')),
      body: ListView.builder(
        itemCount: eventVoteCounts.keys.length,
        itemBuilder: (context, index) {
          final event = eventVoteCounts.keys.toList()[index];
          return ListTile(
            title: Text(event),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, event);
              },
            ),
          );
        },
      ),
    );
  }
}