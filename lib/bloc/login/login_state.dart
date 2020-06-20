import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool noConnection;

  LoginState(
      {@required this.isSubmitting,
        @required this.isSuccess,
        @required this.isFailure,
        @required this.noConnection});

  //initial state
  factory LoginState.initial() {
    return LoginState(
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      noConnection : false
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
      noConnection: false
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isSubmitting: false,
      isFailure: true,
      isSuccess: false,
      noConnection: false
    );
  }

  factory LoginState.success() {
    return LoginState(
      isSubmitting: false,
      isFailure: false,
      isSuccess: true,
      noConnection: false,
    );
  }

  factory LoginState.noconnection() {
    return LoginState(
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      noConnection: true,
    );
  }

  LoginState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool noConnection
  }) {
    return LoginState(
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        noConnection: noConnection ?? this.noConnection);
  }
}
