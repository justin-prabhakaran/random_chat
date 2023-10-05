part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginLoadingState extends LoginState {}
