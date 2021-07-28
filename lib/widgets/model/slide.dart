import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/screen1.png',
      title: 'Book Your Online Bus Ticket',
      description: '   '),
  Slide(
      imageUrl: 'assets/screen2.png',
      title: 'Digital Bus Management System',
      description: '  '),
  Slide(
      imageUrl: 'assets/screen3.png',
      title: 'Through Notification Keep Yourself Updated',
      description: '  '),
];
