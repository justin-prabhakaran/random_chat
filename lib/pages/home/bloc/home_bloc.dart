import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToNextEvent>(homeNavigateToNextEvent);
  }

  FutureOr<void> homeNavigateToNextEvent(
      HomeNavigateToNextEvent event, Emitter<HomeState> emit) {
    print('Clicked');
    emit(HomeNavigateToNextState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeSuccessLoadedState());
  }
}
