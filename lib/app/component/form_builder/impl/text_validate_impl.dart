import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:mobile/app/component/form_builder/iface/validate.dart';
import 'package:mobile/app/config/form_builder/form_config.dart';

class TextFieldValidateImpl extends Validate<String> {
  List<FormFieldValidator<String>> addValue(List<ValidatorEnum>? validator, BuildContext context) {
    List<FormFieldValidator<String>> listValidators = [];

    validator?.forEach((value) {
      switch (value) {
        case ValidatorEnum.userName:
          {
            // listValidators.add(FormBuilderValidators.required(errorText: 'username không được để trống'));
          }
          break;
      }
    });
    return listValidators;
  }

  @override
  List<FormFieldValidator<String>> listValidate(List<ValidatorEnum>? validator, BuildContext context) {
    return addValue(validator, context);
  }
}