import 'package:equatable/equatable.dart';
import '../../models/album.dart';
import '../../models/photo.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;

  const AlbumLoaded(this.albums);

  @override
  List<Object> get props => [albums];
}

class AlbumError extends AlbumState {
  final String message;

  const AlbumError(this.message);

  @override
  List<Object> get props => [message];
}

class AlbumPhotosLoading extends AlbumState {}

class AlbumPhotosLoaded extends AlbumState {
  final List<Photo> photos;

  const AlbumPhotosLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class AlbumPhotosError extends AlbumState {
  final String message;

  const AlbumPhotosError(this.message);

  @override
  List<Object> get props => [message];
} 