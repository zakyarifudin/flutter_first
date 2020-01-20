import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageList/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../MyFinancial/PromoDetail.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<ImageModel> images = [
    ImageModel(8, "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2017/08/Banner-Blog-Seller-Center-1200x630.jpg"),
    ImageModel(9, "https://cdn1-production-images-kly.akamaized.net/_M41k7HOwoddtyymZSh3xQmH7SI=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1108699/original/046181400_1452582417-HUT_12_673x373.jpg"),
    ImageModel(10, "https://www.k24klik.com/blog/wp-content/uploads/2019/05/xBLOG-20-24.jpg.pagespeed.ic.JjP98H-Z0h.jpg"),
    //ImageModel(11, "http://media.pricebook.co.id/article/5a2e4183150ba06f577b23c6/5a2e4183150ba06f577b23c6_1512986530.jpg")
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
          autoPlayInterval: Duration(seconds: 4),
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
  const ImageSliderWidget({Key key, @required this.image}) : super(key: key);

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => PromoDetail(image: image), maintainState: true)
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),       
          child: Hero(
            tag: image.id,
            child : Image(
              image: NetworkImage(image.url),
              fit: BoxFit.fill,
            )
          ), 
        ),
      ),
    );
  }
}



