import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterState extends Equatable {
  final int counter;

  CounterState(this.counter);
  //CounterState(this.counter, [this.propss]);

  // @override
  // List<Object> get props => (propss);
  List<Object> get props => [counter];

}

class SetCounter extends CounterState{
    SetCounter(counter) : super(counter);
}


