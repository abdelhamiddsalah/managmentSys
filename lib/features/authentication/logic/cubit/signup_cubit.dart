import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignupLoading());
      try {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        final name = nameController.text.trim();

        // إنشاء حساب جديد
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User user = userCredential.user!;
        
        // تحديث اسم المستخدم
        await user.updateDisplayName(name);
        await user.reload(); // إعادة تحميل بيانات المستخدم
        user = FirebaseAuth.instance.currentUser!;

        // الحصول على الرمز المميز (Token)
        String? idToken = await user.getIdToken();

        if (idToken != null && idToken.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('id_token', idToken);
          await prefs.setString('user_name', name); // حفظ الاسم في SharedPreferences
        }

        emit(SignupSuccess(user: user, name: name));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          EasyLoading.showInfo('Weak Password, try again');
          emit(SignupFailure('Weak password. Please try again.'));
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.showInfo('The account already exists for that email.');
          emit(SignupFailure('The email is already in use.'));
        } else {
          EasyLoading.showError(e.message ?? 'An error occurred');
          emit(SignupFailure(e.message ?? 'An unknown error occurred.'));
        }
      } catch (e) {
        EasyLoading.showError('An unexpected error occurred');
        emit(SignupFailure('An unexpected error occurred.'));
      }
    }
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? idToken = prefs.getString('id_token');
    String? userName = prefs.getString('user_name');
    if (idToken != null && idToken.isNotEmpty) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(SignupSuccess(user: user, name: userName ?? 'No Name'));
      } else {
        emit(SignupFailure('User not found.'));
      }
    } else {
      emit(SignupFailure('No token found.'));
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('id_token');
      await prefs.remove('user_name');
      emit(SignupInitial());
    } catch (e) {
      emit(SignupFailure('An error occurred during logout.'));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
