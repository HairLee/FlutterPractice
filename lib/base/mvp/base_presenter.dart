import 'mpv_view.dart';
import 'presenter.dart';

class BasePresenter<V extends MvpView> implements Presenter<V> {

  V _mvpView;

  @override
  void attachView(V view) {
    // TODO: implement attachView
    _mvpView = view;
  }

  @override
  void detachView() {
    // TODO: implement detachview
    _mvpView = null;
  }

  V get getMvpView => _mvpView;
}