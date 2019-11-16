import 'dart:async';
import 'package:bloc/bloc.dart';
import 'index.dart';
// import 'dart:developer' as developer;

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => SetCounter(0);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event){
      case CounterEvent.increment :
        yield SetCounter(state.counter + 1);
        break;
      case CounterEvent.decrement :
        yield SetCounter(state.counter - 1);
        break;
      case CounterEvent.reset :
        yield SetCounter(0);
        break;

    }
    // if(event is Increment){
    //   yield SetCounter(state.counter + 1);
    // }
    // else if(event is Decrement){
    //   yield SetCounter(state.counter - 1);
    // }
    // else if(event is Reset){
    //   yield SetCounter(0);
    // }
  }
}
