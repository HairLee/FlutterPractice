class RequestCallback<T> {

  RequestCallback(this.onStart, this.onCompleted, this.onError);

  Function onStart;

  Function(T) onCompleted;

  Function(Exception e) onError;
}