import 'package:flutter/material.dart';
import 'package:flutter_first/Bloc/InfiniteList/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/Screen/InfiniteList/ListLoading.dart';

class InfiniteList extends StatefulWidget {
  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = PostBloc()..add(Fetch());
    // _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(Fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: _postBloc,
        builder: (context, state) {
          if (state is PostUninitialized) {
            return ListLoading();
          }
          if (state is PostError) {
            return Center(
              child: Text('failed to fetch posts'),
            );
          }
          if (state is PostLoaded) {
            if (state.posts.isEmpty) {
              return Center(
                child: Text('no posts'),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? BottomLoader()
                    : PostWidget(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          }

          return Container();
        },
      )
    );
  }
}


class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        onTap: (){ 
          Navigator.of(context).pushNamed('/post-detail', arguments : { "id": post.id});
        },
        leading: Text(
          '${post.id}',
          style: TextStyle(fontSize: 10.0),
        ),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}