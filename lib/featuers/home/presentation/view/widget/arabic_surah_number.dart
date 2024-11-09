import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SvgPicture.asset('assets/svgs/nomor-surah.svg'),
        SvgPicture.asset('assets/image/nomor-surah.svg'),
        SizedBox(
          height: 36,
          width: 36,
          child: Center(
              child: Text(
            ('${i + 1}'),
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500),
          )),
        )
      ],
    );
    // Text(
    // "\uFD3E" + (i + 1).toString().toArabicNumbers + "\uFD3F",
    // style: const TextStyle(
    //     color: Color.fromARGB(255, 0, 0, 0),
    //     fontFamily: 'me_quran',
    //     fontSize: 20,
    //     shadows: [
    //       Shadow(
    //         offset: Offset(.5, .5),
    //         blurRadius: 1.0,
    //         color: Colors.amberAccent,
    //       ),
    //     ]),
    // );
  }
}
