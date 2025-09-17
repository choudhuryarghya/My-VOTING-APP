// this is the page shown after vote is marked. 
//It shows the user the date and time of voting. The user can also leave a feedback if they wish to.

import 'package:flutter/material.dart';

class ConclusionPage extends StatelessWidget {
  const ConclusionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote Submitted'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Thank you for voting!'),
            SizedBox(height: 20),
            Text('Date and time of vote: ${DateTime.now()}'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}