import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/event_list_page.dart';
import 'screens/candidate_list_page.dart';
import 'screens/confirmation_page.dart';
import 'screens/feedback_page.dart';
import 'screens/results_page.dart';
void main()  {
  runApp(VotingApp());
}

class VotingApp extends StatelessWidget {
  const VotingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/eventList': (context) => EventListPage(),
        '/candidates': (context) => CandidatesPage(eventId: ''),
        '/confirmation': (context) => ConfirmationPage(candidateName: '', eventId: ''),
        '/conclusion': (context) => ConclusionPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}
