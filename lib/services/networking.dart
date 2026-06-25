import 'dart:convert';

import 'package:http/http.dart' as http;


/// A helper class responsible for making HTTP GET requests
/// and decoding the JSON response.
///
/// This class is used to simplify network operations by
/// encapsulating the request and JSON parsing logic.
///
/// Example:
/// ```dart
/// final networkHelper = NetworkHelper(url);
/// final data = await networkHelper.getData();
/// ```
class NetworkHelper {

  /// The endpoint URL to which the GET request will be sent.
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
