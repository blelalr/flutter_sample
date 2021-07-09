part of 'photo_cubit.dart';

@immutable
abstract class PhotoState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<dynamic> photos;
  final bool isReachMax;
  PhotoLoaded({required this.photos, required this.isReachMax});

  @override
  List<Object> get props => [photos, isReachMax];
}

class PhotoFailed extends PhotoState {
  final String errorMessage;

  PhotoFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Get PhotoFailed Failure ->> message : $errorMessage';
}
