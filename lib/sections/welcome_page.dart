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

  const WelcomePage({Key? key, this.scrollTo}) : super(key: key);

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

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
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
      key: const ValueKey('aaax'),
      body: Stack(
        key: const ValueKey('aaay'),
        children: [
          SizedBox.expand(
            key: const ValueKey('aaaz'),
            child: FittedBox(
              key: const ValueKey('aaaaa'),
              fit: BoxFit.cover,
              child: SizedBox(
                key: const ValueKey('aaaab'),
                width: _videoCOntroller!.value.size.width,
                height: _videoCOntroller!.value.size.height,
                child: VideoPlayer(
                  _videoCOntroller!,
                ),
              ),
            ),
          ),
          Container(
            key: const ValueKey('aaaac'),
            height: size.height,
            width: size.width,
            color: Colors.transparent.withOpacity(.7),
          ),
          Positioned(
            key: const ValueKey('aaaad'),
            height: size.height,
            width: size.width,
            child: Container(
              key: const ValueKey('aaaae'),
              margin: const EdgeInsets.all(30),
              child: FittedBox(
                key: const ValueKey('aaaaf'),
                fit: BoxFit.scaleDown,
                child: Column(
                  key: const ValueKey('aaaag'),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        key: const ValueKey('aaaah'),
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
                      key: const ValueKey('aaaai'),
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'I\'m a full-stack flutter developer',
                        style: GoogleFonts.ubuntu(
                            fontSize: 45, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      key: ValueKey('aaaaj'),
                    ),
                    Material(
                      key: const ValueKey('aaaak'),
                      color: Colors.transparent,
                      child: InkWell(
                        key: const ValueKey('aaaal'),
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
                            key: const ValueKey('aaaam'),
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.symmetric(
                                horizontal: isPlaying ? 22 : 15,
                                vertical: isPlaying ? 17 : 10),
                            decoration: BoxDecoration(
                              color: isPlaying
                                  ? const Color(0xff04c2c9)
                                  : Colors.transparent,
                              border: Border.all(
                                width: 3,
                                color: isPlaying
                                    ? const Color(0xff04c2c9)
                                    : Colors.white,
                              ),
                            ),
                            child: Row(
                              key: const ValueKey('aaaan'),
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View my work',
                                  key: const ValueKey('aaaao'),
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                  key: ValueKey('aaaap'),
                                ),
                                AnimatedIcon(
                                  key: const ValueKey('aaaaq'),
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
          const DevelopmentStatements(
            key: ValueKey('aaaar'),
          )
        ],
      ),
    );
  }
}


// MATTHEW WILLIAMS