
import 'package:ccb/config/app_config.dart';
import 'package:sp_util/sp_util.dart';

class SpKey{


  static const String tokenKey = "access_token";

  static const String userTypeKey = "user_position";

  static const String userAccount = "user_account";

  static const String userPassword = "user_password";


  static const String userRememberPassword = "user_remember_password";

  static const String userIdKey = "user_id_key";

  static const String languageKey = "language_key";

  static const String deleteAccount = "delete_account";

  static const String searchHistory = "search_history";

  static const String kdData = "kh_data";

  static const String userInfo = "user_info";

  static const String emailList = "email_list";

  static const String editkhhxc = "edit_khhcx";

}

extension SpExtensionBool on bool {

  void get saveRememberPsd => SpUtil.putBool(SpKey.userRememberPassword, this);
}

extension SpExtensionList on List<Object> {

  void get saveEmailList => SpUtil.putObjectList("${SpKey.emailList}${AppConfig.config.balanceLogic.memberInfo.account}", this);
}

extension SpExtension on String{

  void get saveToken => SpUtil.putString(SpKey.tokenKey, this);


  void get saveAccount => SpUtil.putString(SpKey.userAccount, this);

  void get savePassword => SpUtil.putString(SpKey.userPassword, this);

  void get saveUserId => SpUtil.putString(SpKey.userIdKey, this);

  void get saveLanguage => SpUtil.putString(SpKey.languageKey, this);

  void get saveDeleteAccount => SpUtil.putString(SpKey.deleteAccount, this);

  void get saveSearchHistory => SpUtil.putString(SpKey.searchHistory, this);

  void get saveKdData=> SpUtil.putString(SpKey.kdData, this);

  void get saveUserInfo => SpUtil.putString("${SpKey.userInfo}${AppConfig.config.balanceLogic.memberInfo.account}", this);

  void get saveEditKhhxc => SpUtil.putString(SpKey.editkhhxc + AppConfig.config.balanceLogic.memberInfo.phone, this);


}


Future<bool>? get removeAllData => SpUtil.clear();

Future<bool>? removeKey(String key) => SpUtil.remove(key);


String get token => SpUtil.getString(SpKey.tokenKey)??"";

String get account => SpUtil.getString(SpKey.userAccount)??"";

String get password => SpUtil.getString(SpKey.userPassword)??"";

bool get getRememberPsd => SpUtil.getBool(SpKey.userRememberPassword)??false;

String get userId => SpUtil.getString(SpKey.userIdKey)??'';

String get languageValue => SpUtil.getString(SpKey.languageKey)??'';

String get deleteAccountValue => SpUtil.getString(SpKey.deleteAccount)??'';

String get searchHistoryValue => SpUtil.getString(SpKey.searchHistory)??'';

String get kdData => SpUtil.getString(SpKey.kdData)??'';

String get userInfo => SpUtil.getString("${SpKey.userInfo}${AppConfig.config.balanceLogic.memberInfo.account}")??'';

List<Map> get spEmailList => SpUtil.getObjectList("${SpKey.emailList}${AppConfig.config.balanceLogic.memberInfo.account}")??[];

String get editKhhxcContent => SpUtil.getString(SpKey.editkhhxc + AppConfig.config.balanceLogic.memberInfo.phone)??'';

