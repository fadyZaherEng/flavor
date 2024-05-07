import 'package:flavor/flavors.dart';
import 'package:flavor/src/config/theme/color_schemes.dart';
import 'package:flavor/src/presentation/screens/sign_in/widgets/custom_button_widget.dart';
import 'package:flavor/src/presentation/screens/sign_in/widgets/custom_mobile_number_widget.dart';
import 'package:flavor/src/presentation/screens/sign_in/widgets/password_text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _mobileNumberErrorMessage;
  String? _passwordErrorMessage;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        Navigator.pop(context);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: F.isProduction ? ColorSchemes.white : Colors.black12,
          resizeToAvoidBottomInset: true,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      ClipOval(
                        child: Image.asset(
                          "assets/images/ic_launcher.jpg",
                          fit: BoxFit.fitWidth,
                          height: 80,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      CustomMobileNumberWidget(
                        textInputType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        errorMessage: _mobileNumberErrorMessage,
                        controller: _mobileNumberController,
                        labelTitle: "Mobile Number",
                        onChange: (number) {
                          _mobileNumberController.text = number.toString();
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      PasswordTextFieldWidget(
                        errorMessage: _passwordErrorMessage,
                        controller: _passwordController,
                        labelTitle: "Password",
                        onChange: (password) {
                          _passwordController.text = password.toString();
                        },
                      ),
                      const SizedBox(
                        height: 47,
                      ),
                      CustomButtonWidget(
                        width: double.infinity,
                        onTap: () {},
                        text: "Sign In",
                        backgroundColor: F.isProduction
                            ? ColorSchemes.logo
                            : ColorSchemes.primary,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
