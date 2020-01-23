import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterState extends Equatable {
  final int counter;

  CounterState(this.counter);

  @override
  List<Object> get props => [counter];

}

class SetCounter extends CounterState{
    SetCounter(counter) : super(counter);
}


