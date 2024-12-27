import 'package:class_assignment_2/cubit/circle_area_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaView extends StatefulWidget {
  const CircleAreaView({super.key});

  @override
  State<CircleAreaView> createState() => _CircleAreaViewState();
}

class _CircleAreaViewState extends State<CircleAreaView> {
  final radiusController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aashrit Shrestha Circle Area Calculator'),
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
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Radius',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the radius';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Please enter a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<CircleAreaCubit, double>(
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
                      double radius = double.parse(radiusController.text);
                      context.read<CircleAreaCubit>().calculateArea(radius);
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
