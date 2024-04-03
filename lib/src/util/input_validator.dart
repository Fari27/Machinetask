import 'package:flutter/services.dart';

class InputValidator{
  static List<TextInputFormatter> userIdValidator({int maxLength = 100}) {
      return [
      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9.@]+$')),
    ];
  }

 

   static List<TextInputFormatter> mobileNumberValidator({int maxLength = 9}) {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      // FilteringTextInputFormatter.deny(RegExp(r'^0+')),
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }

   static List<TextInputFormatter> passwordValidator() {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(
 RegExp(r'[A-Za-z0-9!@#^&*()_;:-]')
 ),
      FilteringTextInputFormatter.deny(InputValidator.denyEmojis),
    
    ];
  }

   static RegExp denyEmojis = RegExp(
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
}