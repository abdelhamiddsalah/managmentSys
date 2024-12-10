// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managerestaurent/features/authentication/logic/signupCubit/signup_cubit.dart';

class Pickerimage extends StatelessWidget {
  const Pickerimage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: cubit.profilePic != null
                ? FileImage(File(cubit.profilePic!.path))
                : AssetImage('assets/images/png-transparent-avatar-boy-cheerful-mark-avatar-vol-2-icon.png') as ImageProvider,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        cubit.uploadprofilepic(pickedFile);
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
