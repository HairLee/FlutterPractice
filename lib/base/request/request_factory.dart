import 'request_loader.dart';
import 'dart:async';
import 'package:flutter_app_rsa_provider/base/request/request_callback.dart';

class RequestFactory<T> {
  String _url;
  int _requestType;
  RequestCallback<T> _callback;
  Map<String, dynamic> _headers;
  Map<String, dynamic> _params;

  RequestFactory<T> addRequestUrl(String url) {
    _url = url;
    return this;
  }

  RequestFactory<T> addRequestMethod(int requestType) {
    _requestType = requestType;
    return this;
  }

  RequestFactory<T> addHeaders(Map<String, dynamic> header) {
    _headers = header;
    return this;
  }

  RequestFactory<T> addParams(Map<String, dynamic> params) {
    _params = params;
    return this;
  }

  RequestFactory<T> addCallback(RequestCallback<T> callback) {
    _callback = callback;
    return this;
  }

  Future doRequest() {
    if (_url == null) throw Exception("Url must not be null");
    if (_requestType == null) throw Exception("Request type must not be null");

    var requestLoader = new RequestLoader<T>();
    requestLoader.addRequestUrl(_url);
    requestLoader.addRequestMethod(_requestType);

    if (_headers != null)
      requestLoader.addHeaders(_headers);

    if (_params != null)
      requestLoader.addParams(_params);

    if (_callback != null)
      requestLoader.addCallback(_callback);

    return requestLoader.request();
  }
}
