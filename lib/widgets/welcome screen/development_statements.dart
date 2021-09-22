import 'package:basil_personal_web/widgets/welcome%20screen/statements.dart';
import 'package:flutter/material.dart';

class DevelopmentStatements extends StatelessWidget {
  const DevelopmentStatements({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: ValueKey('aaaaaaaaaaad'),
      bottom: 2,
      right: 2,
      child: Padding(
        key: ValueKey('aaaaaaaaaaae'),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          key: ValueKey('aaaaaaaaaaaf'),
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Statements(
              key: ValueKey('aaaaaaaaaaag'),
              title: 'Under devolepment',
              icon: Icons.warning_amber,
              colorOfIcon: Colors.amber,
            ),
            SizedBox(
              height: 3,
              key: ValueKey('aaaaaaaaaaah'),
            ),
            Statements(
              key: ValueKey('aaaaaaaaaaai'),
              title: 'Inspired from Matthew Williams',
              icon: Icons.light,
              colorOfIcon: Colors.green,
            ),
            SizedBox(
              height: 3,
              key: ValueKey('aaaaaaaaaaaj'),
            ),
            Statements(
              key: ValueKey('aaaaaaaaaaak'),
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
