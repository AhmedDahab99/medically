import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/modules/Authrization/Login/cubit/loginStates.dart';

class MedicallyLoginCubit extends Cubit<MedicallyLoginStates> {
  MedicallyLoginCubit() : super(MedicallyLoginInitialState());

  static MedicallyLoginCubit get(context) => BlocProvider.of(context);

  IconData icon = Icons.visibility_rounded;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    icon = isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded;
    emit(MedicallyLoginChangePasswordVisibility());
  }
}
