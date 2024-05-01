import 'package:flutter/material.dart';

Icon selectIconForSupport(String supports, BuildContext context, var selectedColor,int size) {
    switch (supports) {
      case 'TV':
        return Icon(
          Icons.tv,
          size: MediaQuery.of(context).size.width / size,
          color: selectedColor,
        );
      case 'HDMI Port':
        return Icon(
          Icons.settings_input_hdmi_sharp,
          size: MediaQuery.of(context).size.width / size,
          color: selectedColor,
        );
      case 'Board':
        return Icon(
          Icons.video_label,
          size: MediaQuery.of(context).size.width / size,
          color: selectedColor,
        );
      case 'Computer':
        return Icon(
          Icons.monitor,
          size: MediaQuery.of(context).size.width / size,
          color: selectedColor,
        );
      default:
        return const Icon(Icons.error); 
    }
  }