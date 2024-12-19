import 'package:filmvault/component/atom/atom.dart';
import 'package:filmvault/component/molecules/custom_appbar.dart';
import 'package:filmvault/component/molecules/custom_snackbar.dart';
import 'package:filmvault/config/constants/app_strings.dart';
import 'package:filmvault/config/navigation.dart';
import 'package:filmvault/config/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _StateLogin();
}

class _StateLogin extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.build(
        title: AppStrings.login,
        context: context, onTap: () {

      },),
      backgroundColor: Colors.white,
      body: Padding(
        padding: CustomPaddings.padding16_12_16_12(context),
        child: Form(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: CustomSizes.dp15(context),),
            CustomText.textBold(context: context, text: 'Selamat Datang',size: CustomSizes.dp18(context)),
            CustomText.textRegular(context: context, text: 'Silahkan masuk menggunakan akun yang dimiliki',textColor: CustomColors.gray2[4],size: CustomSizes.dp14(context)),
            SizedBox(height: CustomSizes.hp10(context),),
            CustomInputText.textInputBorderWithErrorText(context: context, controller: _usernameController, textHint: 'Username'),
            SizedBox(height: CustomSizes.hp10(context),),
            CustomInputText.inputWithObscureText(
              context: context,
              controller: _passwordController,
              obscureText: secureText,
              textHint: 'Kata Sandi',
              textError: 'Password tidak boleh kosong',
              keyboardType: TextInputType.text,
              onPressed: () {
                setState(() {
                  secureText = !secureText;
                });
              },
            ),
            SizedBox(height: CustomSizes.hp15(context),),
            InkWell(
              onTap: () {

                if(_usernameController.text.toString()!="user" && _passwordController.text.toString()!="123"){
                  return CustomSnackBar.showTop(context, message: 'Username atau Password Salah');
                }
                Navigation.instance.navigateAndReplaceAll(Routes.dashboard);
              },
              child: SizedBox(
                width: CustomSizes.width(context),
                child: CustomButton.buttonGradient(context,
                    gradient1: CustomColors.blue2[12],
                    gradient2: CustomColors.blue2[11],
                    text: AppStrings.login,
                    textColor: Colors.white,
                    textSize: CustomSizes.dp16(context)),
              ),
            )
          ],
        )),
      ),
    );
  }
}
