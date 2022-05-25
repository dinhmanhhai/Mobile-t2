part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class LoginInitial extends HomeState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}
