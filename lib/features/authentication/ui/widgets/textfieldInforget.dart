// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/features/authentication/logic/loginCubit/login_cubit.dart';

class textfieldInforget extends StatelessWidget {
  const textfieldInforget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = context.read<LoginCubit>().emailController;
    return TextFormField(
      controller: emailController,
     decoration: InputDecoration(
       hintText: 'Enter Your Email',
       hintStyle: TextStyle(color: Colors.white),
       prefixIcon: Icon(Icons.email,color: Colors.white,),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20),
         borderSide: BorderSide(color: Colors.white)
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20),
         borderSide: BorderSide(color: Colors.white)
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20),
         borderSide: BorderSide(color: Colors.white)
       ),
     ),
    );
  }
}