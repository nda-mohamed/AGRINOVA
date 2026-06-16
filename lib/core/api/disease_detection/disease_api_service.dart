import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiseaseApiService {
  final String baseUrl = "";

  Future<List> predictDisease(File image) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));

    request.files.add(
      await http.MultipartFile.fromPath('file', image.path),
    );

    var response = await request.send();

    var responseData = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(responseData);
    } else {
      throw Exception("API Error: $responseData");
    }
  }
}