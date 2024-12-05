import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // لإضافة SharedPreferences

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // دالة لتسجيل الدخول
  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoading()); // حالة التحميل
      try {
        final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        ); 
        // الحصول على الـ ID Token
        String? idToken = await credential.user?.getIdToken();
        // تخزين الـ ID Token في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id_token', idToken ?? '');

        emit(LoginSuccess(user: credential.user!)); // حالة النجاح
      } on FirebaseAuthException catch (e) {
        emit(LoginError(message: e.message ?? 'An error occurred')); // حالة الخطأ
      }
    }
  }

  // دالة لإرسال البريد الإلكتروني لإعادة تعيين كلمة المرور
 Future<void> sendPasswordResetEmail() async {
  if (emailController.text.isEmpty) {
    // Show a message if the email field is empty
    emit(LoginError(message: 'Please enter a valid email address.'));
    return;
  }
  try {
    emit(LoginLoading()); // Loading state
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    emit(LoginPasswordResetSuccess());
  } on FirebaseAuthException catch (e) {
    emit(LoginError(message: e.message ?? 'Failed to send reset email'));
  }
}


  // إغلاق الـ controllers
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
