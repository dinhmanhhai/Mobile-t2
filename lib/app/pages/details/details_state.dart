part of 'details_cubit.dart';

@immutable
abstract class DetailsState extends Equatable {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  const DetailsInitial();

  @override
  List<Object> get props => [];
}


class Uploading extends DetailsState {
  const Uploading();

  @override
  List<Object> get props => [];
}

