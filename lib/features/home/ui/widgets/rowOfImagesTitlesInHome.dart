// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/features/home/logic/cubit/enums_state_cubit.dart';
import 'package:managerestaurent/features/home/ui/widgets/icecream_view.dart';
import 'package:managerestaurent/features/home/ui/widgets/pizzas_view.dart';
import 'package:managerestaurent/features/home/ui/widgets/salads_view.dart';
import 'package:managerestaurent/features/home/ui/widgets/sandwachies_view.dart';

enum ImageEnums { icecream, burger, pizza, salad }

class RowOfImagesTitlesInHome extends StatelessWidget {
  const RowOfImagesTitlesInHome({super.key});

  final List<String> images = const [
    'assets/images/ice-cream.png',
    'assets/images/burger.png',
    'assets/images/pizza.png',
    'assets/images/salad.png',
  ];

  final List<ImageEnums> imageTypes = const [
    ImageEnums.icecream,
    ImageEnums.burger,
    ImageEnums.pizza,
    ImageEnums.salad,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnumsStateCubit(),
      child: BlocBuilder<EnumsStateCubit, ImageEnums>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(images.length, (index) {
                  final isSelected = state == imageTypes[index];
                  return GestureDetector(
                    onTap: () => context
                        .read<EnumsStateCubit>()
                        .changeNewsType(imageTypes[index]),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          images[index],
                          width: 50,
                          height: 50,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              // استخدام Offstage بدلاً من Visibility
              Offstage(
                offstage: state != ImageEnums.icecream,
                child: const IcecreamView(),
              ),
              Offstage(
                offstage: state != ImageEnums.burger,
                child: const SandwachiesView(),
              ),
              Offstage(
                offstage: state != ImageEnums.pizza,
                child: const PizzasView(),
              ),
              Offstage(
                offstage: state != ImageEnums.salad,
                child: const SaladsView(),
              ),
            ],
          );
        },
      ),
    );
  }
}
