import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_chat/pages/home/bloc/home_bloc.dart';
import 'package:random_chat/pages/login/ui/login_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeNavigateToNextState) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      bloc: homeBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeSuccessLoadedState:
            return mainWid(homeBloc: homeBloc);
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class mainWid extends StatelessWidget {
  const mainWid({
    super.key,
    required this.homeBloc,
  });

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'Random Chat',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/undraw_intense_feeling.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Stack(
              children: [
                Text('Connect With People'),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'All Over The World',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                homeBloc.add(HomeNavigateToNextEvent());
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4))
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF006FFD),
                ),
                child: const Center(
                  child: Text('Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
