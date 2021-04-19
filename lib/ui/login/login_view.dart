import 'package:finance_flutter_app/ui/home/home_screen.dart';
import 'package:finance_flutter_app/ui/login/bloc/login_cubit.dart';
import 'package:finance_flutter_app/ui/signup/signup_sample.dart';
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:finance_flutter_app/utils/preferences.dart';
import 'package:finance_flutter_app/utils/state_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bloc/login_state.dart';

class LoginView extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () {
          SharedPreferencesManager().onLogout();
          _usernameController.text = "test";
          _passwordController.text = "qwerty123qwerty123";
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocListener<LoginCubit, LoginState>(listener: (context, state) {
            switch (state.runtimeType) {
              case ErrorLoginState:
                ErrorLoginState errorState = state as ErrorLoginState;
                Fluttertoast.showToast(
                    msg: errorState.errorMessages.first,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white);
                break;
              case SuccessfulLoginState:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                break;
            }
          }, child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case InitialLoginState:
                  return _buildMainState(context);
                  break;
                case LoadingLoginState:
                  return _buildLoadingState(context);
                  break;
                default:
                  return _buildMainState(context);
                  break;
              }
            },
          )),
        ));
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  Widget _buildMainState(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.logo),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    Strings.headerLogin,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 0.5
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)
                      )
                    ),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: Strings.fieldUsername,
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.normal
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        errorBorder: InputBorder.none,
                        errorText: "", // ToDo set error text
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue,
                            width: 0.5
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)
                        )
                    ),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: Strings.fieldPassword,
                          labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          errorBorder: InputBorder.none,
                          errorText: "", // ToDo set error text
                          border: InputBorder.none,
                          focusedErrorBorder: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, bottom: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        context.read<LoginCubit>().login(_usernameController.text, _passwordController.text);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0
                            ),
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            Strings.actionLogin,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        text: Strings.hintNoAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                          fontSize: 16,
                          letterSpacing: 0.3
                        ),
                        children: [
                          TextSpan(
                            text: Strings.actionSignUp,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 16,
                              letterSpacing: 0.3
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SampleSignUpPage()));
                              }
                          )
                        ]
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}