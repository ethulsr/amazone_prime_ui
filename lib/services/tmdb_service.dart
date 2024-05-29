import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBService {
  final String apiKey = '0d57e289fc5473d610a6e8e80ac87c42';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<Map<String, dynamic>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<Map<String, dynamic>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load top-rated movies');
    }
  }

  Future<Map<String, dynamic>> getPopularTVShows() async {
    final response = await http.get(
      Uri.parse('$baseUrl/tv/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load popular TV shows');
    }
  }

  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<Map<String, dynamic>> search(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/multi?api_key=$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to perform search');
    }
  }
}
