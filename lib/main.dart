import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'blocs/album/album_bloc.dart';
import 'blocs/album/album_event.dart';
import 'repositories/album_repository.dart';
import 'screens/album_list_screen.dart';
import 'screens/album_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AlbumListScreen(),
        ),
        GoRoute(
          path: '/album-detail',
          builder: (context, state) {
            final album = state.extra as dynamic;
            return AlbumDetailScreen(album: album);
          },
        ),
      ],
    );

    return BlocProvider(
      create: (context) => AlbumBloc(
        repository: AlbumRepository(),
      )..add(LoadAlbums()),
      child: MaterialApp.router(
        title: 'Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
} 