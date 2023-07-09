import 'package:flutter/material.dart';

class CAtegory {
  const CAtegory({
    required this.id,
    required this.title,
    this.color = Colors.orange,//setting the default color so that if no color would be provided this fallback default color would be used.
  });

  final String id;
  final String title;
  final Color color; //it is a flutter specific type.
}
