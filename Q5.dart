import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final url = Uri.https(
    'jsonplaceholder.typicode.com',
    '/posts/1',
    {'q': '{http}'},
  );

  // Await the HTTP GET response, then decode the
  // JSON data it contains.
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    final userId = jsonResponse["userId"];
    final id = jsonResponse["id"];
    final title = jsonResponse["title"];
    final body = jsonResponse["body"];

    print('userId: $userId.');
    print('id: $id.');
    print('title: $title.');
    print('body:\n$body.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
