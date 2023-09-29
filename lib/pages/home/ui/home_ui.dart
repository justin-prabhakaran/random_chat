import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_chat/pages/home/bloc/home_bloc.dart';

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
          print('NAvigated');
        }
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      bloc: homeBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeSuccessLoadedState:
            return Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          width: 45.w,
                          height: 45.w,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Random Chat',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    SizedBox(
                      width: 398.w,
                      height: 293.w,
                      child: Image.asset(
                        'assets/images/undraw_intense_feeling.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Stack(
                      children: [
                        const Text('Connect With People'),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'All Over The World',
                            style: TextStyle(
                                fontSize: 35.sp, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    InkWell(
                      onTap: () {
                        homeBloc.add(HomeNavigateToNextEvent());
                      },
                      child: Container(
                        width: 249.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x3F000000),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ],
                          borderRadius: BorderRadius.circular(15.r),
                          color: const Color(0xFF006FFD),
                        ),
                        child: Center(
                          child: Text('Get Started',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
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
