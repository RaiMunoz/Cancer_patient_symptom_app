import 'package:flutter/material.dart';
import './chat_main.dart';
import './inbox_button.dart';

// add three message buttons that lead to a new chatScreen //

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      color: Colors.teal[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InboxButton('Care Team', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => ChatScreen()),
                  );
                },),

                InboxButton('Friends and Family', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => ChatScreen()),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}