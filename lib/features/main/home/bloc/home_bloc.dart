import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepo;
  HomeBloc(this.homeRepo) : super(HomeStateLoading()) {
    on<HomeEvent>((event, emit)async {
      if(event is HomeEventInit){
        try {
          emit(HomeStateLoading());
          final homeModel = await homeRepo.getHome();
          log('true');
          emit(HomeStateLoaded(homeModel));
        } catch (e) {
          emit(HomeStateError());
          log('error');
        }
      }
    });
  }
}
