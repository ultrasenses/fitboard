import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/text_constants.dart';
import 'package:ultrasenses_fitboard/screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:ultrasenses_fitboard/screens/forgot_password/widget/forgot_password_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(TextConstants.passwordReset, style: TextStyle(color: ColorConstants.textWhite, fontSize: 18)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: const IconThemeData(
            color: ColorConstants.primaryColor,
          )),
      body: _buildContext(context),
    );
  }

  BlocProvider<ForgotPasswordBloc> _buildContext(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (BuildContext context) => ForgotPasswordBloc(),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (_, currState) => currState is ForgotPasswordInitial,
        builder: (context, state) {
          return const ForgotPasswordContent();
        },
        listenWhen: (_, currState) => currState is ForgotPasswordError || currState is ForgotPasswordSuccess,
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            forgotPasswordSuccessfullySended(context);
          }
          if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
      ),
    );
  }

  Future<void> forgotPasswordSuccessfullySended(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(TextConstants.resetPasswordLinkWasSent), duration: Duration(seconds: 2)));
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
  }
}
