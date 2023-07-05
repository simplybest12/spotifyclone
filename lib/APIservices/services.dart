import 'dart:convert';
import 'package:http/http.dart' as http;

class APIservices {
  static const clientId = '45675c9b70114fd2a787658be6ba3316';
  static const clientSecret = '21183e4d2a8942efa15e9b9755aa777f';
  static const trackId = '2TpxZ7JUBn3uw46aR7qd6V';

  static Future<String> getAccessToken() async {
    final authOptions = Uri.parse('https://accounts.spotify.com/api/token');
    final basicAuth = base64.encode(utf8.encode('$clientId:$clientSecret'));

    final response = await http.post(
      authOptions,
      headers: {
        'Authorization': 'Basic $basicAuth',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      print(token);
      fetchTrack(trackId, token);
      generateApiLink(trackId, token);
      return token;
    } else {
      throw Exception('Failed to fetch access token');
    }
  }

  static Future<String> fetchTrack(String trackId, String accessToken) async {
    final url = Uri.parse('https://api.spotify.com/v1/tracks/$trackId');

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final trackName = data;
      // print(trackName);
      // print(data);

      return trackName;
    } else {
      throw Exception('Failed to fetch track');
    }
  }

  static String generateApiLink(String trackId, String accessToken) {
    final baseUrl = 'https://api.spotify.com/v1/tracks/';
    final encodedTrackId = Uri.encodeComponent(trackId);
    final apiUrl = '$baseUrl$encodedTrackId';

    final encodedAccessToken = Uri.encodeComponent(accessToken);
    final finalUrl = Uri.parse(apiUrl)
        .replace(queryParameters: {'access_token': encodedAccessToken});

    print("Final url $finalUrl");
    return finalUrl.toString();
  }
}
