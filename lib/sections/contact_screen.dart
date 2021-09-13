import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  // Color? color = Colors.transparent;
  // Color? borderColor = Colors.white;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff252934),
      child: Container(
        height: widget.height,
        child: Flex(direction: Axis.vertical, children: [
          Flexible(
            flex: 10,
            child: Container(
              color: Color(0xff252934),
              height: min(widget.height!, double.infinity),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50, bottom: 10),
                      child: Text(
                        'CONTACT',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w700,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 4,
                      color: Colors.white,
                    ),
                    SizedBox(height: 50),
                    Text('Have a question or want to work together?',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff07b0b7))),
                    SizedBox(height: 50),
                    Container(
                      width: 500,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              height: 40,
                              width: 500,
                              color: Color(0xff1e242c),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  // contentPadding: EdgeInsets.only(bottom: 10),
                                  hintText: "Name",
                                  hintStyle:
                                      TextStyle(color: Color(0xff6b6b6c)),
                                ),
                              )),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              height: 40,
                              width: 500,
                              color: Color(0xff1e242c),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  // contentPadding: EdgeInsets.only(bottom: 10),
                                  hintText: "Enter email",
                                  hintStyle:
                                      TextStyle(color: Color(0xff6b6b6c)),
                                ),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              color: Color(0xff1e242c),
                              height: 150,
                              width: 500,
                              child: TextFormField(
                                // maxLength: 250,
                                maxLines: 10,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  // contentPadding: EdgeInsets.all(7),
                                  hintText: "Your Message",
                                  hintStyle:
                                      TextStyle(color: Color(0xff6b6b6c)),
                                ),
                              )),
                          InkWell(
                            onTap: () {},
                            onHover: (t) {
                              if (t) {
                                setState(() {
                                  isHovered = true;
                                });
                              } else {
                                setState(() {
                                  isHovered = false;
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: isHovered
                                      ? Color(0xff04c2c9)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isHovered
                                        ? Color(0xff04c2c9)
                                        : Colors.white,
                                  )),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      child: null,
                    )
                  ],
                ),
                color: Color(0xff1b242f),
              ))
        ]),
      ),
    );
  }
}
