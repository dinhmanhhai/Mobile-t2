part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class ButtonPressable extends LoginState {
  const ButtonPressable();

  @override
  List<Object> get props => [];
}

class Loging extends LoginState {
  const Loging();

  @override
  List<Object> get props => [];
}

class Signed extends LoginState {
  const Signed();

  @override
  List<Object> get props => [];
}
//
// class LoginError extends LoginState {
//   final String message;
//
//   const LoginError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
