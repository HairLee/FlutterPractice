import 'package:flutter_app_rsa_provider/base/mvp/mpv_view.dart';
import 'user.dart';

abstract class TestViewImpl extends MvpView {

  void onStartTestRequest();

   void onLoadListUserSuccess(List<User> data);

   void onLoadListUserFail(Exception e);
}