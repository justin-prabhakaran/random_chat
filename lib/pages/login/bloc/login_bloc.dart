import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccessState());
  }
}
