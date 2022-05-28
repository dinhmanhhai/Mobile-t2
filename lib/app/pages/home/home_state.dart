part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class ChangeView extends HomeState {
  const ChangeView();

  @override
  List<Object> get props => [];
}

class GridTileView extends HomeState {
  const GridTileView();

  @override
  List<Object> get props => [];
}

class ListTileView extends HomeState {
  const ListTileView();

  @override
  List<Object> get props => [];
}


class FetchingNotes extends HomeState {
  const FetchingNotes();

  @override
  List<Object> get props => [];
}
