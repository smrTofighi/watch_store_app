import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  late Timer timer;
  int _start = 120;
  TimerCubit() : super(TimerInitialState()){
    emit(TimerStartState(seconds: _start));
  }
  startTimer(context){
     const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
   
        if (_start == 0) {
        timer.cancel();
        emit(TimerStopState());
        Navigator.of(context).pop();
      } else {
        _start--;
        emit(TimerStartState(seconds: _start));
      }
      
    });
  }
}
