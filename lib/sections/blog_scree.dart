import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: min(height!, double.infinity),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 10),
            child: Text(
              'BLOG',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 44,
                  color: Color(0xff444649)),
            ),
          ),
          Container(
            width: 70,
            height: 4,
            color: Color(0xff45474a),
          ),
        ],
      ),
    );
  }
}
