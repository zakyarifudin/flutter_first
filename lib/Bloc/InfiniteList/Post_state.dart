import 'package:equatable/equatable.dart';
import './index.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostLoaded({
    this.posts,
    this.hasReachedMax,
  });

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() => 'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax}';
}

class PostDetailLoaded extends PostState {
  final Post post;

  const PostDetailLoaded({
    this.post,
  });

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'PostDetailLoaded { post : $post}';
}