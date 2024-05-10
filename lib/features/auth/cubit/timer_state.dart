part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitialState extends TimerState {}

final class TimerStartState extends TimerState{
  final int seconds;
  TimerStartState({required this.seconds});}

  final class TimerStopState extends TimerState{}
