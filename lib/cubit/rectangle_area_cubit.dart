import 'package:flutter_bloc/flutter_bloc.dart';

class RectangleAreaCubit extends Cubit<double> {
  RectangleAreaCubit() : super(0.0);

  void calculateArea(double length, double breadth) {
    emit(length * breadth);
  }
}
