import 'package:get_storage/get_storage.dart';

class PreferenceUtil {

  static final PreferenceUtil _instance = PreferenceUtil._internal();
  static final _box = GetStorage();

  PreferenceUtil._internal();

  static PreferenceUtil getInstance() {
    return _instance;
  }

  Future<void> putValue(String key, dynamic value) async{
    await _box.write(key, value);
  }

  T? getValue<T>(String key, {dynamic defaultValue}) {
    return _box.read(key) ?? defaultValue;
  }



}

enum PreferenceKey {
  isLoggedIn,
  otpCode
}