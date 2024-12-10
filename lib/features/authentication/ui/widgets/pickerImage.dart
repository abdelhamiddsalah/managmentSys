// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/signup_cubit.dart';

class Pickerimage extends StatelessWidget {
  const Pickerimage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 100,
          width: 100,
          child:context.read<SignupCubit>().profilePic==null? CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(
                'assets/images/png-transparent-avatar-boy-cheerful-mark-avatar-vol-2-icon.png'),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 3, color: Colors.white),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then(
                                    (value) => context.read<SignupCubit>().uploadprofilepic(value!),
                                  );
                            },
                            child: Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                    ))
              ],
            ),
          ): CircleAvatar(backgroundImage: FileImage(File(context.read<SignupCubit>().profilePic!.path)),)
        );
      },
    );
  }
}
