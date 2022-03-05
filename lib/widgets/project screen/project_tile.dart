import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:basil_personal_web/widgets/project%20screen/project_detals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  ProjectTile({
    Key? key,
    required this.i,
    required this.images,
    required this.subTiltles,
    required this.topAnimations,
    required this.bottomAnimations,
  }) : super(key: key);
  final int i;
  final List<String> images;
  final Map<String, String> subTiltles;
  final List<Animation<Offset>> topAnimations;
  final List<Animation<Offset>> bottomAnimations;
  final List<List<String>> desImages = [
    [
      'assets/billing/a.png',
      'assets/billing/b.png',
      'assets/billing/c.png',
      'assets/billing/d.png',
      'assets/billing/e.png',
      'assets/billing/f.png',
    ],
    [
      'assets/chat/a.png',
      'assets/chat/b.png',
      'assets/chat/c.png',
    ],
    [
      'assets/billing/a.png',
      'assets/billing/b.png',
      'assets/billing/c.png',
      'assets/billing/d.png',
      'assets/billing/e.png',
      'assets/billing/f.png',
    ],
    [
      'assets/shoppy/a.png',
      'assets/shoppy/b.png',
      'assets/shoppy/c.png',
      'assets/shoppy/d.png',
    ],
    [
      'assets/portfolio/b.png',
      'assets/portfolio/c.png',
      'assets/portfolio/d.png',
      'assets/portfolio/e.png',
      'assets/portfolio/f.png',
    ],
    [
      'assets/expense/a.png',
      'assets/expense/b.png',
      'assets/expense/c.png',
      'assets/expense/d.png',
    ],
    [
      'assets/todo/a.png',
      'assets/todo/b.png',
      'assets/todo/c.png',
      'assets/todo/d.png',
    ],
    [
      'assets/link/a.png',
      'assets/link/b.png',
      'assets/link/c.png',
      'assets/link/d.png',
      'assets/link/e.png',
    ],
    [
      'assets/notification/a.png',
      'assets/notification/b.png',
      'assets/notification/c.png',
    ],
  ];
  final List<String> urls = [
    'https://github.com/bazl-E/commercial-billing-app',
    'https://github.com/bazl-E/Chat-app-firebase-',
    'https://github.com/bazl-E/billing-app-with-out-authentication',
    'https://github.com/bazl-E/ShoppyShop',
    'https://github.com/bazl-E/Portfolio',
    'https://github.com/bazl-E/Expenses_Tracker',
    'https://github.com/bazl-E/to_do-with-local-notification',
    'https://github.com/bazl-E/Link-Tree',
    'https://github.com/bazl-E/Learn_local_Notification',
  ];
  final Map<String, String> details = {
    'Manage orders':
        'Ebook-billing is an app that helps to manage all types of orders in a single app. also your data are stored in a cloud server .access and secure your data from anywhere using your user id and password',
    'chatting platform':
        'Connect is a simple application to stay connected with your friends. just join the chat by creating an account with a user id and profile picture every message contains user name and profile picture',
    'Made managing orders simple':
        'Billing is a simple app exactly the same as manage orders ,but this time you don\'t have to log in to access the application,so data are less secure',
    'Do shopping while you are anywhere':
        'Shoppy is geat looking application that helps to sell products, the unique style makes the application great and friendly.',
    'find basil portfolio':
        'As you think this is my portfolio the website you are currently in, i used flutter and dart to make ',
    'Expenses tracker':
        'Personal Expenses is another great-looking application that helps to store your expenses, so you can manage your salary. Also, this application gives you a weekly progression to find which day you spend most and which day you gained most.',
    'Day managing assistant':
        'ToDo is the best assistant to manage your day. this will helps you to divide your day into tasks.provide the tasks you have to do the day with the time so you will get reminders on the sharp time no matter how much tasks you have to do,the color codes used in this app helps you to feel friendly and find tasks easily',
    'Store all your links in a single place':
        'LinkTree as the name represents its \'s website which holds all your links,like social media youtube or other links so that you only have to provide a single small link in your profiles ,which makes your profile clean',
    'Deeply Learn local notification in flutter':
        'this app is a great source to learn all types of local notifications in a flutter.with the source code of the app within 5 minutes you can be a pro in flutter local notification. to achieve this we are added maximum comments in our code',
  };

  void showcustomDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            key: const ValueKey('aaaaaaaaax'),
            scale: a1.value,
            child: Opacity(
                key: const ValueKey('aaaaaaaaay'),
                opacity: a1.value,
                child: ProjectDetails(
                  key: const ValueKey('aaaaaaaaaz'),
                  images: desImages[i],
                  title: subTiltles.keys.toList()[i],
                  subtitle: details.keys.toList()[i],
                  descrption: details.values.toList()[i],
                  gitUrl: urls[i],
                  // descrption: ,
                  // gitUrl: ,
                  // subtitle: ,
                )),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container(
            key: const ValueKey('aaaaaaaaaaa'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<ProjectcreenManager>(context);
    return Stack(
      key: const ValueKey('aaaaaaaaaab'),
      children: [
        SizedBox(
          key: const ValueKey('aaaaaaaaaac'),
          width: 390,
          height: 300,
          child: Image.asset(
            images[i],
            key: const ValueKey('aaaaaaaaaad'),
            fit: BoxFit.cover,
          ),
        ),
        AnimatedOpacity(
          key: const ValueKey('aaaaaaaaaae'),
          opacity: (manage.isHovered && (i == manage.hoveredIndex)) ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            key: const ValueKey('aaaaaaaaaaf'),
            duration: const Duration(milliseconds: 500),
            width: 390,
            height: 300,
            child: Column(
              key: const ValueKey('aaaaaaaaaag'),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlideTransition(
                  key: const ValueKey('aaaaaaaaaah'),
                  position: bottomAnimations[i],
                  child: Column(
                    key: const ValueKey('aaaaaaaaaai'),
                    children: [
                      Text(
                        subTiltles.keys.toList()[i],
                        key: const ValueKey('aaaaaaaaaaj'),
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.3,
                          color: const Color(0xff1b242f),
                        ),
                      ),
                      Text(
                        subTiltles.values.toList()[i],
                        key: const ValueKey('aaaaaaaaaak'),
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: const Color(0xffe31b6d),
                        ),
                      ),
                    ],
                  ),
                ),
                SlideTransition(
                  key: const ValueKey('aaaaaaaaaal'),
                  position: topAnimations[i],
                  child: InkWell(
                    key: const ValueKey('aaaaaaaaaam'),
                    onTap: () {
                      showcustomDialog(context);
                    },
                    onHover: (t) {
                      if (t) {
                        manage.setButtonHovered(true);
                      } else {
                        manage.setButtonHovered(false);
                      }
                    },
                    child: AnimatedContainer(
                      key: const ValueKey('aaaaaaaaaan'),
                      duration: const Duration(milliseconds: 200),
                      width: 170,
                      decoration: BoxDecoration(
                          color:
                              (manage.buttonHovered && manage.hoveredIndex == i)
                                  ? const Color(0xffe31c6e)
                                  : null,
                          border: Border.all(color: Colors.pink, width: 2)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Center(
                        key: const ValueKey('aaaaaaaaaao'),
                        child: Text(
                          'LEARN MORE',
                          key: const ValueKey('aaaaaaaaaap'),
                          style: GoogleFonts.raleway(
                            fontSize: 17.3,
                            color: (manage.buttonHovered &&
                                    manage.hoveredIndex == i)
                                ? Colors.white
                                : const Color(0xff1b242f),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            color: const Color(0xfff5f5f5),
          ),
        ),
      ],
    );
  }
}
