import 'package:flutter/material.dart';
import 'package:random_chat/pages/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstNameEditingController = TextEditingController();
    TextEditingController _lastNameEditingController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current is LoginActionState,
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginSuccessState:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(top: 20),
                    child: Image.asset(
                        'assets/images/undraw_personal_information.png'),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _firstNameEditingController,
                    decoration: const InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Color(0xFF8F9098))),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _lastNameEditingController,
                    decoration: const InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Color(0xFF8F9098))),
                  )
                ],
              );
            case LoginLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoginErrorState:
              return const Center(
                child: Text('Something Wrong'),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
