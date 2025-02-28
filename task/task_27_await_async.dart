import 'dart:async';

void main() async {
  List<String> users = await fetchUsers();

  print('Users loaded:');
  for (var user in users) {
    print(user);
  }
}

Future<List<String>> fetchUsers() async {
  await Future.delayed(Duration(seconds: 2));
  String user1 = await fetchUserData('User 1');

  await Future.delayed(Duration(seconds: 2));
  String user2 = await fetchUserData('User 2');

  await Future.delayed(Duration(seconds: 2));
  String user3 = await fetchUserData('User 3');

  return [user1, user2, user3];
}

Future<String> fetchUserData(String userName) async {
  await Future.delayed(Duration(seconds: 1));
  return userName;
}
