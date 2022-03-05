abstract class MedicallyLoginStates {}

class MedicallyLoginInitialState extends MedicallyLoginStates {}

class MedicallyLoginLoadingState extends MedicallyLoginStates {}

class MedicallyLoginSuccessState extends MedicallyLoginStates {}

class MedicallyLoginErrorState extends MedicallyLoginStates {
  final String error;
  MedicallyLoginErrorState(this.error);
}

class MedicallyLoginChangePasswordVisibility extends MedicallyLoginStates {}