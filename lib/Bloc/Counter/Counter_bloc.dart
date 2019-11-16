import 'dart:async';
import 'package:bloc/bloc.dart';
import 'index.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => SetCounter(0);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if(event is Increment){
      yield SetCounter(state.counter + 1);
    }
    else if(event is Decrement){
      yield SetCounter(state.counter - 1);
    }
    else if(event is Reset){
      yield SetCounter(0);
    }
  }
}
