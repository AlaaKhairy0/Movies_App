import 'package:movies_app/result.dart';

sealed class BaseState<T>{}
class SuccessState<T> extends BaseState<T>{
  T data;
  SuccessState({required this.data});
}
class LoadingState<T> extends BaseState<T>{
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}
class ErrorState<T> extends BaseState<T>{
  ServerError? serverError;
  Error? error;
  ErrorState({this.serverError,this.error});
}