import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslems_app/cubit%20services/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterIntialState());
  int counter = 0;
  void increment(int basecount) {
    emit(CounterLoadingState());
    if (counter < basecount) {
      counter++;
    }
    emit(CounterIncrementState());
  }

  void setIintialCount(int intialcount) {
    emit(CounterLoadingState());
    counter = intialcount;
    emit(CounterIntialState());
  }
}
