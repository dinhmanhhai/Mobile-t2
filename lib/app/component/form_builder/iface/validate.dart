import 'package:flutter/cupertino.dart';
import 'package:mobile/app/config/form_builder/form_config.dart';

abstract class Validate<T>{
  List<FormFieldValidator<T>> listValidate(List<ValidatorEnum>? validator, BuildContext context);
}