import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageList/FullImage.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {

  List<ImageModel> images = [
    ImageModel(1, "https://images.unsplash.com/photo-1576830065688-ad1e480b863d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(2, "https://images.unsplash.com/photo-1562886929-c29b9a76b0a4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(3, "https://images.unsplash.com/photo-1576808597967-93bd9aaa6bae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(4, "https://images.unsplash.com/photo-1576790359694-14504775f70d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(5, "https://images.unsplash.com/photo-1576813906115-5f45de2a4390?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(6, "https://images.unsplash.com/photo-1576792275520-2226541b2889?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(7, "https://images.unsplash.com/photo-1576830065688-ad1e480b863d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(8, "https://images.unsplash.com/photo-1562886929-c29b9a76b0a4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(9, "https://images.unsplash.com/photo-1576808597967-93bd9aaa6bae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(10, "https://images.unsplash.com/photo-1576790359694-14504775f70d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(11, "https://images.unsplash.com/photo-1576813906115-5f45de2a4390?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(12, "https://images.unsplash.com/photo-1576792275520-2226541b2889?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: images.map((image) {
          return ImageWidget(image: image);
        }).toList()
      )
    );
  }
}

class ImageModel {
  final int id;
  final String url;

  ImageModel(this.id, this.url);

}


class ImageWidget extends StatelessWidget {
  final ImageModel image;

  const ImageWidget({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FullImage(image: image)
        )
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: FadeInImage(
            fadeInCurve: Curves.ease,
            placeholder: AssetImage('images/loading_now.gif'),
            image: NetworkImage(image.url),
            fit: BoxFit.fill,
          ),
        ),
      )
    );
  }
}



