import 'package:flutter/material.dart';
import './index.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatelessWidget {
  final ImageModel image;

  const FullImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PhotoView(
        imageProvider: NetworkImage(image.url),
        minScale: 1.0,
        maxScale: 5.0,
      ),
    );
  }
}