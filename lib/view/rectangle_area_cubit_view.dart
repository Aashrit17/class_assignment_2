import 'package:class_assignment_2/cubit/rectangle_area_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RectangleAreaView extends StatefulWidget {
  const RectangleAreaView({super.key});

  @override
  State<RectangleAreaView> createState() => _RectangleAreaViewState();
}

class _RectangleAreaViewState extends State<RectangleAreaView> {
  final lengthController = TextEditingController();
  final breadthController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aashrit Shrestha Rectangle Area Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: lengthController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Length',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the length';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Please enter a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: breadthController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Breadth',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the breadth';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Please enter a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<RectangleAreaCubit, double>(
                builder: (context, area) {
                  return Text(
                    'Area: $area',
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      double length = double.parse(lengthController.text);
                      double breadth = double.parse(breadthController.text);
                      context
                          .read<RectangleAreaCubit>()
                          .calculateArea(length, breadth);
                    }
                  },
                  child: const Text('Calculate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
