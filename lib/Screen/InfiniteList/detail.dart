import 'package:flutter/material.dart';
import 'package:flutter_first/Bloc/InfiniteList/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/language/App_localizations.dart';

class PostDetail extends StatefulWidget {
  final id;

  PostDetail({Key key, @required this.id}): super(key: key);
  
  @override
  _PostDetail createState() => _PostDetail();
}

class _PostDetail extends State<PostDetail> {

  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = PostBloc()..add(FetchDetail(widget.id));
  }

  @override
  void dispose() {
    super.dispose();
    _postBloc.close();
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios), 
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppLocalizations.of(context).translate("Post Detail") + ' ${widget.id}'),
      ),   
      body: BlocBuilder<PostBloc, PostState>(
        bloc: _postBloc,
        builder: (context, state) {
          if(state is PostUninitialized){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is PostDetailLoaded){
            if(state.post == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),   
                        child: Center(
                          child: Text(
                            "${state.post.id}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        height: 100,
                        width: 500,
                        decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),   
                        child: Center(
                          child: Text(
                            "${state.post.title}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        height: 300,
                        width: 500,
                        decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),   
                        child: Center(
                          child: Text(
                            "${state.post.body}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }

          if (state is PostError) {
            return Center(
              child: Text('Check Your Intenet Connection'),
            );
          }

          return Container();
        }
      )
    );
  }
}