import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Data fetched successfully:');
      print('Title: ${data['title']}');
      print('Body: ${data['body']}');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
