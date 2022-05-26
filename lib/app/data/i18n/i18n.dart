import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static final _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          "Login": "Đăng nhập",
          "Network Exception": "Lỗi kết nối",
        }
      };
}
