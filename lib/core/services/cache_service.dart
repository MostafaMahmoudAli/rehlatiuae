import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  T? getData<T>({required String key});

  Future<Unit> setData({required String key, required dynamic value});

  Future<Unit> clear();
}

class CacheServiceImpl extends CacheService {
  final SharedPreferences pref;

  CacheServiceImpl({required this.pref});

  @override
  T? getData<T>({required String key}) {
    getIt<Logger>().i("Start `getData` in |CachingService| ~~key~~ $key");
    T? value;
    if (T.toString() == 'int') {
      value = pref.getInt(key) as T?;
    }
    if (T.toString() == 'double') {
      value = pref.getDouble(key) as T?;
    }
    if (T.toString() == 'bool') {
      value = pref.getBool(key) as T?;
    }
    if (T.toString() == 'String') {
      value = pref.getString(key) as T?;
    }
    getIt<Logger>().w(
      "End `getData` in |CachingService| ~~$key~~ $value",
    );
    return value;
  }

  @override
  Future<Unit> setData({required String key, required dynamic value}) async {
    getIt<Logger>().i(
      "Start `setData` in |CachingService| ~~key~~ $key, ~~value~~ $value",
    );
    bool isSetDone = false;
    if (value is int) {
      isSetDone = await pref.setInt(key, value);
    }
    if (value is double) {
      isSetDone = await pref.setDouble(key, value);
    }
    if (value is bool) {
      isSetDone = await pref.setBool(key, value);
    }
    if (value is String) {
      isSetDone = await pref.setString(key, value);
    }
    if (value == null) {
      isSetDone = await pref.remove(key);
    }
    getIt<Logger>().w(
      "End `setData` in |CachingService| ~~isSetDone~~ $isSetDone",
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> clear() async {
    getIt<Logger>().i("Start `clear` in |CachingService|");
    final clear = await pref.clear();
    getIt<Logger>().w(
      "End `clear` in |CachingService| ~~isClear~~ $clear ",
    );
    return Future.value(unit);
  }
}
