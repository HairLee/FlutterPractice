import 'dart:async';
import 'dart:convert';

import 'package:flutter_app_rsa_provider/base/request/request_callback.dart';
import 'package:flutter_app_rsa_provider/base/request/request_type.dart';
import 'package:http/http.dart' as http;

class RequestLoader<T> {
  String _url;
  int _requestType;
  RequestCallback<T> _callback;
  Map<String, dynamic> _headers;
  Map<String, dynamic> _params;

  RequestLoader<T> addRequestUrl(String url) {
    _url = url;
    return this;
  }

  RequestLoader<T> addRequestMethod(int requestType) {
    _requestType = requestType;
    return this;
  }

  RequestLoader<T> addHeaders(Map<String, dynamic> header) {
    _headers = header;
    return this;
  }

  RequestLoader<T> addParams(Map<String, dynamic> params) {
    _params = params;
    return this;
  }

  RequestLoader<T> addCallback(RequestCallback<T> callback) {
    _callback = callback;
    return this;
  }

  Future request() async {
    if (_url.isEmpty) throw Exception('URL is empty!!');
    http.Response response;
    if (_callback != null) {
      _callback.onStart();
    }
    try {
      switch (_requestType) {
        case RequestType.POST:
          response = await http.post(_url, headers: _headers, body: _params);
          break;
        case RequestType.GET:
          response = await http.get(_url, headers: _headers);
          break;
        default:
          response = await http.get(_url, headers: _headers);
      }

      if (response != null) {
        int statusCode = response.statusCode;
        String jsonResponse = response.body;
        print("RequestLoader=>url= $_url \n statusCode= $statusCode \n json=$jsonResponse");
        if (_callback != null) {
          if (statusCode < 200 || statusCode > 400) {
            _callback.onError(new RequestException(statusCode, response.body));
          } else {
            _callback.onCompleted(json.decode(jsonResponse));
          }
        }
      }
    } catch(e) {
      if (_callback != null)
        _callback.onError(e);
    }
  }
}

class RequestException implements Exception {
  int errorCode;
  String errorMessage;

  RequestException(this.errorCode, this.errorMessage);
}
