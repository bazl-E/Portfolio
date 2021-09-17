import 'package:basil_personal_web/widgets/welcome%20screen/statements.dart';
import 'package:flutter/material.dart';

class DevelopmentStatements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      right: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Statements(
              title: 'Under devolepment',
              icon: Icons.warning_amber,
              colorOfIcon: Colors.amber,
            ),
            SizedBox(height: 3),
            Statements(
              title: 'Inspired from Matthew Williams',
              icon: Icons.light,
              colorOfIcon: Colors.green,
            ),
            SizedBox(height: 3),
            Statements(
              title: 'Made of flutter and dart',
              icon: Icons.flutter_dash_rounded,
              colorOfIcon: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
