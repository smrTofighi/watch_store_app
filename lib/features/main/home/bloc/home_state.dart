part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeStateLoading extends HomeState {}
final class HomeStateError extends HomeState {}
final class HomeStateLoaded extends HomeState {
  final HomeModel  homeModel;
  const HomeStateLoaded(this.homeModel);
}
