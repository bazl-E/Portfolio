import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player_web/video_player_web.dart';
// import 'package:video_player/video_player.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';
  WelcomePage({Key? key, this.scrollTo}) : super(key: key);
  final Future Function(int i)? scrollTo;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  bool isPlaying = false;
  double? vpadding = 10;
  double? hpadding = 15;
  VideoPlayerController? _videoCOntroller;
  Color? color = Colors.transparent;
  Color? bordercolor = Colors.white;
  var p;

  @override
  void initState() {
    super.initState();
    print('init................');
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _videoCOntroller = VideoPlayerController.asset('assets/basil.mp4');
    _videoCOntroller!.initialize().then((value) {
      if (_videoCOntroller!.value.isInitialized) {
        _play();
      }
      // _play();
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // _videoCOntroller!.setVolume(0);
      // _videoCOntroller!.play();
      // _videoCOntroller!.setLooping(true);
      // setState(() {});
      // if (!_videoCOntroller!.value.isInitialized) {
      //   _videoCOntroller!.initialize().then((value) {
      //     _play();
      //   });
      // }
      // if (_videoCOntroller!.value.isInitialized) {
      //   _play();
      // }
    });
  }

  void initialise() async {}
  void _play() {
    _videoCOntroller!.setVolume(0);
    _videoCOntroller!.play();
    _videoCOntroller!.setLooping(true);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _videoCOntroller!.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoCOntroller!.value.isInitialized) {
      _play();
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
                width: _videoCOntroller!.value.size.width,
                height: _videoCOntroller!.value.size.height,
                child: VideoPlayer(_videoCOntroller!)),
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          color: Colors.transparent.withOpacity(.7),
        ),
        Positioned(
          height: size.height,
          width: size.width,
          child: Container(
            margin: EdgeInsets.all(30),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Hello, I\'m',
                            style: GoogleFonts.ubuntu(
                                fontSize: 45, color: Colors.white)),
                        TextSpan(
                            text: ' Muhammed Basil E',
                            style: GoogleFonts.ubuntu(
                                fontSize: 45, color: Colors.pink))
                      ])),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'I\'m a full-stack flutter developer',
                      style:
                          GoogleFonts.ubuntu(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        widget.scrollTo!(1);
                      },
                      onHover: (val) {
                        if (!val) {
                          setState(
                            () {
                              hpadding = 15;
                              vpadding = 10;

                              isPlaying = false;
                              color = Colors.transparent;
                              bordercolor = Colors.white;
                              _animationController!.reverse();
                            },
                          );
                        } else {
                          setState(
                            () {
                              hpadding = 22;
                              vpadding = 17;

                              isPlaying = true;
                              color = Colors.lightBlue[600];
                              bordercolor = Colors.lightBlue[600];
                              _animationController!.forward();
                            },
                          );
                        }
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                              horizontal: hpadding!, vertical: vpadding!),
                          decoration: BoxDecoration(
                              color: color,
                              border: Border.all(
                                width: 3,
                                color: bordercolor!,
                              )),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View my work',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              AnimatedIcon(
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
        Positioned(
          bottom: 2,
          right: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: .5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.amber,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text('Under devolepment',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white, fontSize: 10))
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Opacity(
                  opacity: .5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.light,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text('Inspired from Matthew Williams',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white, fontSize: 10))
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Opacity(
                  opacity: .5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flutter_dash_rounded,
                        color: Colors.blue,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text('Made of flutter and dart',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white, fontSize: 10))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
// MATTHEW WILLIAMS