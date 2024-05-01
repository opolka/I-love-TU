
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color.fromRGBO(2, 2, 2, 0),Color.fromRGBO(0, 0, 0, 0.63),],
          begin: Alignment.topCenter,
          //end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/temp/PUEY UNGPHAKORN CENTENARY HALL, THAMMASAT UNIVERSITY - Arsomsilp 1.png'),
              fit: BoxFit.fill,
              //colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
        ),
      );
    }
}