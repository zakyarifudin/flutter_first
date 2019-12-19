import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends PostEvent {}

class FetchDetail extends PostEvent {
  final int id;

  FetchDetail(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Post Detail { id: $id }';
}