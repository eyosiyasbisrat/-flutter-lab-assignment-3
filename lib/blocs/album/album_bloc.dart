import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<LoadAlbums>(_onLoadAlbums);
    on<LoadAlbumPhotos>(_onLoadAlbumPhotos);
  }

  Future<void> _onLoadAlbums(LoadAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await repository.getAlbums();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }

  Future<void> _onLoadAlbumPhotos(LoadAlbumPhotos event, Emitter<AlbumState> emit) async {
    emit(AlbumPhotosLoading());
    try {
      final photos = await repository.getPhotos(event.albumId);
      emit(AlbumPhotosLoaded(photos));
    } catch (e) {
      emit(AlbumPhotosError(e.toString()));
    }
  }
} 