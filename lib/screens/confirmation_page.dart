// screens/confirmation_page.dart

import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String candidateName;
  final String eventId;

  const ConfirmationPage({super.key, required this.candidateName, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Vote'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Are you sure about your vote?'),
            SizedBox(height: 10),
            Text(
              candidateName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()  {
                Navigator.pushNamed(context, '/conclusion');
              },
              child: Text('Yes'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}