import 'package:flutter_nti_task/core/cache/cache_data.dart';
import 'package:flutter_nti_task/core/cache/cache_helper.dart';
import 'package:flutter_nti_task/core/cache/cache_key.dart';
import 'package:flutter_nti_task/core/translations/ar.dart';
import 'package:flutter_nti_task/core/translations/en.dart';
import 'package:flutter_nti_task/core/translations/translation_keys.dart';
import 'package:get/get.dart';

class TranslationHelper implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        CacheKeys.keyAR: ar,
        CacheKeys.keyEN: en,
      };

  static Future setLanguage() async {
    CacheDate.lang = await CacheHelper.getData(key: CacheKeys.langKey);

    if (CacheDate.lang == null) {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyEN);
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheDate.lang = CacheKeys.keyEN;
    }
  }

  static changeLanguage(bool isAr) async {
    if (isAr) {
      await CacheHelper.saveData(
          key: CacheKeys.langKey, value: CacheKeys.keyAR);
      await Get.updateLocale(TranslationKeys.localeAR);
      CacheDate.lang = CacheKeys.keyAR;
    } else {
      await CacheHelper.saveData(
        key: CacheKeys.langKey,
        value: CacheKeys.keyEN,
      );
      await Get.updateLocale(TranslationKeys.localeEN);
      CacheDate.lang = CacheKeys.keyEN;
    }
  }
}
