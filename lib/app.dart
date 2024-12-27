import 'package:class_assignment_2/cubit/circle_area_cubit.dart';
import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:class_assignment_2/cubit/rectangle_area_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CircleAreaCubit()),
        BlocProvider(create: (context) => SimpleInterestCubit()),
        BlocProvider(create: (context) => RectangleAreaCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<CircleAreaCubit>(),
            context.read<SimpleInterestCubit>(),
            context.read<RectangleAreaCubit>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        home: DashboardView(),
      ),
    );
  }
}
