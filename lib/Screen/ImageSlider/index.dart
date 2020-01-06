import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageList/index.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  List<ImageModel> images = [
    // ImageModel(1, "https://images.unsplash.com/photo-1576830065688-ad1e480b863d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    //ImageModel(2, "https://images.unsplash.com/photo-1562886929-c29b9a76b0a4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(3, "https://images.unsplash.com/photo-1576808597967-93bd9aaa6bae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    // ImageModel(4, "https://images.unsplash.com/photo-1576790359694-14504775f70d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    // ImageModel(5, "https://images.unsplash.com/photo-1576813906115-5f45de2a4390?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30"),
    ImageModel(6, "https://images.unsplash.com/photo-1576792275520-2226541b2889?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEwNzM3N30")
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider.builder(
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return ImageSliderWidget(image: images[index]);
          },
          itemCount: images.length
        ),
        Positioned(
          // top: 0.0,
          left: MediaQuery.of(context).size.width * 0.4,
          right: MediaQuery.of(context).size.width * 0.4,
          bottom: -10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((image) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == images.indexOf(image) ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              );
            }).toList(),
          )
        )
      ]
    );
  }
}



class ImageSliderWidget extends StatelessWidget {
  final ImageModel image;

  const ImageSliderWidget({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Yey"),
      child: Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),       
          child: FadeInImage(
            fadeInCurve: Curves.ease,
            placeholder: AssetImage('images/loading_now.gif'),
            image: NetworkImage(image.url, scale: 0.5), 
          ),
        ),
      )
    );
  }
}



