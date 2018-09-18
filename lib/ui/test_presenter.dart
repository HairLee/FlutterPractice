import 'package:flutter_app_rsa_provider/base/mvp/base_presenter.dart';
import 'package:flutter_app_rsa_provider/base/request/request_callback.dart';
import 'package:flutter_app_rsa_provider/base/request/request_factory.dart';
import 'package:flutter_app_rsa_provider/base/request/request_type.dart';

import 'test_viewimpl.dart';
import 'user.dart';

class TestPresenter extends BasePresenter<TestViewImpl> {
  void fetchUsers() {
    new RequestFactory<List<dynamic>>()
        .addRequestUrl("https://api.github.com/users")
        .addRequestMethod(RequestType.GET)
        .addCallback(new RequestCallback(() { // onStart
          getMvpView.onStartTestRequest();
        }, (data) { // onCompleted
          getMvpView.onLoadListUserSuccess(_parseListUser(data));
        }, (e) { // onError
          getMvpView.onLoadListUserFail(e);
        })).doRequest();
  }

  List<User> _parseListUser(List data) {
    return data.map((u) => User.fromJson(u)).toList();
  }
}
