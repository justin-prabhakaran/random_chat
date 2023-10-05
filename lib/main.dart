import 'package:flutter/material.dart';
import 'package:random_chat/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_chat/pages/home/ui/home_ui.dart';
import 'package:random_chat/pages/login/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.white),
        home: const HomeScreen(),
      ),
    );
  }
}
