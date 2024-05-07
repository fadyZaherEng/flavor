import 'dart:async';
import 'dart:io';

import 'package:city_eye/flavors.dart';
import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/check_app_version.dart';
import 'package:city_eye/src/core/utils/launch_store.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/data/sources/local/singleton/app/app_singleton.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/usecase/get_current_country_code_use_case.dart';
import 'package:city_eye/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:city_eye/src/presentation/screens/sign_in/utils/show_suppliers_bottom_sheet.dart';
import 'package:city_eye/src/presentation/screens/sign_in/widgets/forget_password_widget.dart';
import 'package:city_eye/src/presentation/screens/sign_in/widgets/remember_me_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_mobile_number_widget.dart';
import 'package:city_eye/src/presentation/widgets/password_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends BaseStatefulWidget {
  const SignInScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SignInScreenState();
}

class _SignInScreenState extends BaseState<SignInScreen>
    with WidgetsBindingObserver {
  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _mobileNumberErrorMessage;
  String? _passwordErrorMessage;
  bool _isCheckRememberMe = false;
  bool _isDebouncing = false;
  String _countryCode = '';
  final AppSingleton _appSingleton = AppSingleton();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _scrollToBottomScreenWhenKeyboardOpen();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_appSingleton.getShowUpdateDialog() &&
        F.appFlavor == Flavor.production) {
      try {
        await checkVersion(
          context: context,
          isMandatory: false,
          onTapUpdate: () async {
            //Todo if it's Mandatory don't set it to false
            _appSingleton.setShowUpdateDialog(false);
            Navigator.pop(context);
            launchStore();
          },
          onSkipTab: () {
            Navigator.pop(context);
            _appSingleton.setShowUpdateDialog(false);
          },
        );
      } catch (e) {
        //Todo Handle Error State
      }
    }
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is ExitAppState) {
          _showExitAppDialog();
        } else if (state is NavigateBackState) {
          _navigateBack();
        } else if (state is MobileNumberEmptyFormatState) {
          _mobileNumberErrorMessage = state.mobileNumberValidatorMessage;
        } else if (state is MobileNumberFormatValidState) {
          _mobileNumberErrorMessage = null;
        } else if (state is PasswordEmptyFormatState) {
          _passwordErrorMessage = state.passwordValidatorMessage;
        } else if (state is PasswordFormatValidState) {
          _passwordErrorMessage = null;
        } else if (state is ChangeRememberMeValueState) {
          _isCheckRememberMe = state.rememberMeValue;
        } else if (state is NavigateToForgotPasswordScreenState) {
          if (_isCheckRememberMe) {
            _bloc.add(ChangeRememberMeValueEvent(
              rememberMeValue: false,
            ));
          }
          _navigateToForgotPasswordScreen();
        } else if (state is SignInSuccessState) {
          _setRememberMeValueEvent();
          _navigateToMainScreen();
        } else if (state is SignInErrorState) {
          _showMessageDialog(
            message: state.errorMessage,
            icon: ImagePaths.error,
            onTap: () {
              _navigateBackEvent();
            },
          );
        } else if (state is OpenSupplierBottomSheetState) {
          _showSuppliersBottomSheet(
            context: context,
            user: state.user,
          );
        } else if (state is SelectSupplierState) {
          _setRememberMeValueEvent();
          _navigateToMainScreen();
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: true,
          onPopInvoked: (value) {
            _exitAppEvent();
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
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
                            child: SvgPicture.asset(
                              ImagePaths.logo,
                              fit: BoxFit.fitWidth,
                              height: 80,
                              width: 50,
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
                            countryCode: _countryCode,
                            errorMessage: _mobileNumberErrorMessage,
                            controller: _mobileNumberController,
                            labelTitle: S.of(context).mobileNumber,
                            onChange: (number, code) {
                              _mobileNumberController.text = number.toString();
                              _countryCode = code;
                              _validateMobileNumberEvent(number, code);
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          PasswordTextFieldWidget(
                            errorMessage: _passwordErrorMessage,
                            controller: _passwordController,
                            labelTitle: S.of(context).password,
                            onChange: _validatePasswordEvent,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RememberMeWidget(
                                isCheckRememberMe: _isCheckRememberMe,
                                onTap: () {
                                  _changeRememberMeEvent(_isCheckRememberMe);
                                },
                                onChange: _changeRememberMeEvent,
                              ),
                              ForgetPasswordWidget(
                                onTap: () {
                                  _navigateToForgotPasswordScreenEvent();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 47,
                          ),
                          CustomButtonWidget(
                            width: double.infinity,
                            onTap: _signInEvent,
                            text: S.of(context).signIn,
                            backgroundColor: ColorSchemes.primary,
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
      },
    );
  }

  void _setRememberMeValueEvent() {
    _bloc.add(SetRememberMeEvent(rememberMeValue: _isCheckRememberMe));
  }

  void _navigateToMainScreen() {
    Navigator.pushNamedAndRemoveUntil(context, Routes.main,
        (Route<dynamic> route) => false
    );
  }

  void _changeRememberMeEvent(bool value) {
    _bloc.add(ChangeRememberMeValueEvent(
      rememberMeValue: value,
    ));
  }

  void _navigateToForgotPasswordScreenEvent() {
    _bloc.add(NavigateToForgotPasswordScreenEvent());
  }

  void _init() {
    WidgetsBinding.instance.addObserver(
      this,
    );
    _countryCode = GetCurrentCountryCodeUseCase(injector())();
  }

  void _scrollToBottomScreenWhenKeyboardOpen() {
    final isKeyboardOpen =
        WidgetsBinding.instance.window.viewInsets.bottom != 0.0;
    if (isKeyboardOpen) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showSuppliersBottomSheet({
    required BuildContext context,
    required User user,
  }) {
    showSuppliersBottomSheet(
      context: context,
      suppliers: user.suppliers,
      onSupplierSelected: (supplier) {
        _bloc.add(
          SelectSupplierEvent(
            user: user,
            supplier: supplier,
          ),
        );
      },
      height: 400,
    );
  }

  void _showMessageDialog({
    required String message,
    required String icon,
    required Function() onTap,
  }) {
    showMessageDialogWidget(
      context: context,
      text: message,
      icon: icon,
      buttonText: S.of(context).ok,
      onTap: onTap,
    );
  }

  void _validatePasswordEvent(String value) {
    _bloc.add(ValidatePasswordEvent(
      password: value,
    ));
  }

  void _validateMobileNumberEvent(String number, String code) {
    _bloc.add(ValidateMobileNumberEvent(
      mobileNumber: number,
      regionCode: code,
    ));
  }

  void _signInEvent() {
    if (!_isDebouncing) {
      setState(() {
        _isDebouncing = true;
      });

      _bloc.add(
        SignInPressedEvent(
          mobileNumber: _mobileNumberController.text,
          password: _passwordController.text,
          regionCode: _countryCode,
        ),
      );

      Timer(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _isDebouncing = false;
          });
        }
      });
    }
  }

  void _navigateBackEvent() {
    _bloc.add(NavigateBackEvent());
  }

  void _exitAppEvent() {
    _bloc.add(ExitAppEvent());
  }

  void _showExitAppDialog() {
    showActionDialogWidget(
        context: context,
        text: S.of(context).areYouSureYouWantExitCityEye,
        icon: ImagePaths.warning,
        primaryText: S.of(context).no,
        secondaryText: S.of(context).yes,
        primaryAction: _navigateBackEvent,
        secondaryAction: () async {
          exit(0);
        });
  }

  void _navigateToForgotPasswordScreen() {
    Navigator.pushNamed(
      context,
      Routes.forgetPassword,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(
      this,
    );
    _scrollController.dispose();
  }
}
