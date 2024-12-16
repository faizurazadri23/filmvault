import 'package:flutter/material.dart';
import 'atom.dart';

class CustomInputText {
  static textInputBorderTitleWithErrorText({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController controller,
    required String textHint,
    Function(String)? onFieldSubmitted,
    String textError = "Data tidak boleh kosong",
    TextInputType keyboardType = TextInputType.text,
    Color fillColor = Colors.white,
    Color textColor = CustomColors.font,
    Color labelColor = Colors.grey,
    double sizeHintText = 12,
    int maxLines = 1,
    int minLines = 1,
    Color borderColor = CustomColors.font,
    bool readOnly = false,
    filled = false,
  }) {
    return TextFormField(
      style: TextStyle(
        fontSize: CustomSizes.dp12(context),
        color: textColor,
      ),
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: CustomColors.orange2[1],
      maxLines: maxLines,
      minLines: minLines,
      onChanged: (val) {
        formKey.currentState!.validate();
      },
      onFieldSubmitted: (value) {
        onFieldSubmitted!(value);
      },
      readOnly: readOnly,
      validator: (val) => val!.isEmpty ? textError : null,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        contentPadding: CustomPaddings.padding10_10_10_10(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: textHint,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: sizeHintText,
        ),
        enabledBorder: CustomOutlineInput.enableBorderCustom(context,
            borderColor: borderColor),
        focusedBorder: CustomOutlineInput.focusedBorderCustom(context,
            borderColor: borderColor),
        focusedErrorBorder: CustomOutlineInput.focusedErrorBorder(context),
        errorBorder: CustomOutlineInput.errorBorder(context),
        errorStyle: TextStyle(
          color: CustomColors.red2[1],
          fontSize: CustomSizes.dp10(context),
        ),
        counterStyle: TextStyle(
          color: CustomColors.black2[0],
          fontSize: CustomSizes.dp12(context),
        ),
      ),
    );
  }

  static inputWithObscureText({
    required BuildContext context,
    required TextEditingController controller,
    required String textHint,
    required String textError,
    required bool obscureText,
    required Function() onPressed,
    Color textColor = CustomColors.font,
    TextInputType keyboardType = TextInputType.text,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      style: TextStyle(
        fontSize: CustomSizes.dp12(context),
        color: textColor,
      ),
      focusNode: focusNode,
      obscureText: obscureText,
      controller: controller,
      cursorColor: CustomColors.orange2[1],
      validator: (val) => val!.length < 2 ? textError : null,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: CustomSizes.dp12(context),
        ),
        errorStyle: TextStyle(
          color: CustomColors.red2[1],
          fontSize: CustomSizes.dp10(context),
        ),
        fillColor: CustomColors.ptrBlueGray.withOpacity(0.1),
        suffixIcon: IconButton(
          color: Colors.black.withOpacity(0.2),
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onPressed,
        ),
        filled: true,
        contentPadding: CustomPaddings.padding16_12_16_12(context),
        enabledBorder: CustomOutlineInput.enableBorder(context),
        focusedBorder: CustomOutlineInput.focusedBorder(context),
        focusedErrorBorder: CustomOutlineInput.focusedErrorBorder(context),
        errorBorder: CustomOutlineInput.errorBorder(context),
      ),
    );
  }

  static textInputBorderWithErrorText({
    required BuildContext context,
    required TextEditingController controller,
    required String textHint,
    String textError = "Data tidak boleh kosong",
    TextInputType keyboardType = TextInputType.text,
    Color textColor = CustomColors.font,
    double sizeText = 12,
    int maxLines = 1,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      style: TextStyle(
        fontSize: CustomSizes.dp12(context),
        color: textColor,
      ),
      focusNode: focusNode,
      // onEditingComplete: () => FocusScope.of(context).dispose,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: CustomColors.orange2[1],
      maxLines: maxLines,
      validator: (val) => val!.isEmpty ? textError : null,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: CustomSizes.dp12(context),
        ),
        errorStyle: TextStyle(
          color: CustomColors.red2[1],
          fontSize: CustomSizes.dp10(context),
        ),
        counterStyle: TextStyle(
          color: CustomColors.black2[0],
          fontSize: CustomSizes.dp12(context),
        ),
        fillColor: CustomColors.ptrBlueGray.withOpacity(0.1),
        filled: true,
        contentPadding: CustomPaddings.padding16_12_16_12(context),
        enabledBorder: CustomOutlineInput.enableBorder(context),
        focusedBorder: CustomOutlineInput.focusedBorder(context),
        focusedErrorBorder: CustomOutlineInput.focusedErrorBorder(context),
        errorBorder: CustomOutlineInput.errorBorder(context),
      ),
    );
  }

  static textInputSearchWithClearInput({
    required BuildContext context,
    required Function(String) onChanged,
    required Function() onClearText,
    required Function(String) onSubmit,
    String textHint = 'Cari..',
    required TextEditingController controller,
    Color border = CustomColors.ptrBlueGray,
    Color borderColor = CustomColors.font,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: CustomSizes.dp12(context),
        color: CustomColors.font,
      ),
      onChanged: onChanged,
      onFieldSubmitted: (value) {
        onSubmit(value);
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          enabledBorder: CustomOutlineInput.enableBorderCustom(context,
              borderColor: borderColor),
          focusedBorder: CustomOutlineInput.focusedBorderCustom(context,
              borderColor: borderColor),
          filled: true,
          contentPadding: CustomPaddings.padding10_10_10_10(context),
          fillColor: Colors.white,
          hintText: textHint,
          hintStyle: TextStyle(
            color: CustomColors.gray2[0],
            fontSize: CustomSizes.dp12(context),
          ),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: onClearText,
                  icon: Icon(
                    Icons.highlight_remove_rounded,
                    size: CustomSizes.dp18(context),
                  )),
          prefixIcon: Icon(
            Icons.search,
            size: CustomSizes.dp18(context),
          )),
    );
  }
}
