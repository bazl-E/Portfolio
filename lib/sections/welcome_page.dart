import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:basil_personal_web/providers/welcome_screen_manage.dart';
import 'package:basil_personal_web/widgets/welcome%20screen/development_statements.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';

  WelcomePage({Key? key, this.scrollTo}) : super(key: key);

  final Future Function(int i)? scrollTo;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  //animation controller for animating icon in welcome screen
  AnimationController? _animationController;
  //video controller for setting background video in welcome screen
  VideoPlayerController? _videoCOntroller;

  //function to statrt video playing
  void initialise() async {}
  void _play() {
    _videoCOntroller!.setVolume(0);
    _videoCOntroller!.play();
    _videoCOntroller!.setLooping(true);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _videoCOntroller = VideoPlayerController.asset('assets/basil.mp4');
    _videoCOntroller!.initialize().then((value) {
      if (_videoCOntroller!.value.isInitialized) {
        _play();
      }
    });
  }

  @override
  void dispose() {
    _videoCOntroller!.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoCOntroller!.value.isInitialized) {
      _play();
    }

    final manage = Provider.of<WelcomescreenManager>(context);
    var isPlaying = manage.isPlaying;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: ValueKey('aaax'),
      body: Stack(
        key: ValueKey('aaay'),
        children: [
          SizedBox.expand(
            key: ValueKey('aaaz'),
            child: FittedBox(
              key: ValueKey('aaaaa'),
              fit: BoxFit.cover,
              child: SizedBox(
                key: ValueKey('aaaab'),
                width: _videoCOntroller!.value.size.width,
                height: _videoCOntroller!.value.size.height,
                child: VideoPlayer(
                  _videoCOntroller!,
                ),
              ),
            ),
          ),
          Container(
            key: ValueKey('aaaac'),
            height: size.height,
            width: size.width,
            color: Colors.transparent.withOpacity(.7),
          ),
          Positioned(
            key: ValueKey('aaaad'),
            height: size.height,
            width: size.width,
            child: Container(
              key: ValueKey('aaaae'),
              margin: EdgeInsets.all(30),
              child: FittedBox(
                key: ValueKey('aaaaf'),
                fit: BoxFit.scaleDown,
                child: Column(
                  key: ValueKey('aaaag'),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        key: ValueKey('aaaah'),
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Hello, I\'m',
                            style: GoogleFonts.ubuntu(
                                fontSize: 45, color: Colors.white),
                          ),
                          TextSpan(
                            text: ' Muhammed Basil E',
                            style: GoogleFonts.ubuntu(
                                fontSize: 45, color: Colors.pink),
                          )
                        ])),
                    RichText(
                      key: ValueKey('aaaai'),
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'I\'m a full-stack flutter developer',
                        style: GoogleFonts.ubuntu(
                            fontSize: 45, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      key: ValueKey('aaaaj'),
                    ),
                    Material(
                      key: ValueKey('aaaak'),
                      color: Colors.transparent,
                      child: InkWell(
                        key: ValueKey('aaaal'),
                        onTap: () async {
                          widget.scrollTo!(1);
                        },
                        onHover: (val) {
                          if (!val) {
                            manage.setplaying(false);
                            _animationController!.reverse();
                          } else {
                            manage.setplaying(true);
                            _animationController!.forward();
                          }
                        },
                        child: AnimatedContainer(
                            key: ValueKey('aaaam'),
                            duration: Duration(milliseconds: 300),
                            padding: EdgeInsets.symmetric(
                                horizontal: isPlaying ? 22 : 15,
                                vertical: isPlaying ? 17 : 10),
                            decoration: BoxDecoration(
                              color: isPlaying
                                  ? Color(0xff04c2c9)
                                  : Colors.transparent,
                              border: Border.all(
                                width: 3,
                                color: isPlaying
                                    ? Color(0xff04c2c9)
                                    : Colors.white,
                              ),
                            ),
                            child: Row(
                              key: ValueKey('aaaan'),
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View my work',
                                  key: ValueKey('aaaao'),
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                  key: ValueKey('aaaap'),
                                ),
                                AnimatedIcon(
                                  key: ValueKey('aaaaq'),
                                  icon: AnimatedIcons.view_list,
                                  progress: _animationController!,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DevelopmentStatements(
            key: ValueKey('aaaar'),
          )
        ],
      ),
    );
  }
}


// MATTHEW WILLIAMS