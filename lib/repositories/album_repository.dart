import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';
import '../models/photo.dart';

class AlbumRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Album>> getAlbums() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/albums'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.take(15).toList().asMap().entries.map((entry) {
          final index = entry.key + 1;
          final json = entry.value;
          return Album(
            id: json['id'],
            userId: json['userId'],
            title: 'Album $index',
          );
        }).toList();
      } else {
        throw Exception('Failed to load albums');
      }
    } catch (e) {
      throw Exception('Failed to load albums: $e');
    }
  }

  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/photos?albumId=$albumId'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
} 