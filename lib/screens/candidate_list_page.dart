// screens/candidates_page.dart

import 'package:flutter/material.dart';

class CandidatesPage extends StatefulWidget {
  final String eventId;

  const CandidatesPage({super.key, required this.eventId});

  @override
  _CandidatesPageState createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  final List<Map<String, String>> candidates = [
    {'name': 'Candidate 1', 'details': 'Details of Candidate 1'},
    {'name': 'Candidate 2', 'details': 'Details of Candidate 2'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          var candidate = candidates[index];
          return ListTile(
            title: Text(candidate['name']!),
            subtitle: Text(candidate['details']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/confirmation',
                arguments: {
                  'candidateName': candidate['name'],
                  'eventId': widget.eventId,
                },
              );
            },
          );
        },
      ),
    );
  }
}