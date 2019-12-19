import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import './index.dart';

class PostBloc extends Bloc<PostEvent, PostState> {


  @override
  Stream<PostState> transformEvents(
    Stream<PostEvent> events,
    Stream<PostState> Function(PostEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PostEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    final PostProvider _postProvider = PostProvider();

    // Fetch All Post   
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _postProvider.fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final posts = await _postProvider.fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: currentState.posts + posts,
                  hasReachedMax: false
                );
        }
      } catch (_) {
        yield PostError();
      }
    }

    // Fetch Detail of Post   
    if (event is FetchDetail) {
      try {
        if (currentState is PostUninitialized) {
          final post = await _postProvider.fetchPostDetail(event.id);
          yield PostDetailLoaded(post: post); 
          return;
        }
      } catch (_) {
        yield PostError();
      }
    }

  }

  bool _hasReachedMax(PostState state) => state is PostLoaded && state.hasReachedMax;

}