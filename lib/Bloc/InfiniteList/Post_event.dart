import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends PostEvent {}

class FetchDetail extends PostEvent {
  final int postId;

  FetchDetail(this.postId);

  @override
  List<Object> get props => [postId];

  @override
  String toString() => 'Post Detail { id: $postId }';
}