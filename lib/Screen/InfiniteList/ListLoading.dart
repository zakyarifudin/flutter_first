import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListLoading extends StatefulWidget {  
  @override
  _ListLoading createState() => _ListLoading();
}

class _ListLoading extends State<ListLoading> {

  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[300],
          child: PostWidgetLoading(),
          //period: Duration(milliseconds: time),
        );
      },
      itemCount: 7
    );
  }
}



class PostWidgetLoading extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double containerWidth = 300;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.5,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
