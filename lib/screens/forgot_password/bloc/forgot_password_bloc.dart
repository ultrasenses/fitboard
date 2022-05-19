import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultrasenses_fitboard/core/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial());
  final emailController = TextEditingController();
  bool isError = false;

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordTappedEvent) {
      try {
        yield ForgotPasswordLoading();
        await AuthService.resetPassword(emailController.text);
        yield ForgotPasswordSuccess();
      } catch (e) {
        print('Error: ' + e.toString());
        yield ForgotPasswordError(message: e.toString());
      }
    }
  }
}
