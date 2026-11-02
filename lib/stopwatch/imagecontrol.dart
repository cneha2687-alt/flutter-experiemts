import 'package:flutter_application_1/resources/imagestrings.dart';
import 'package:flutter/material.dart';

class ImageViewState extends StatefulWidget {
  const ImageViewState({super.key});

  @override
  State<ImageViewState> createState() => _ImageViewStateState();
}

class _ImageViewStateState extends State<ImageViewState> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(s1)
          ),
      ),
    );
  }
}