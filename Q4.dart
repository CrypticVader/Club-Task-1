import 'dart:io';

class Instagram {
  Map _userMeta = {}; // map of user id and user meta data
  Map<int, List<Map<String, dynamic>>> _posts =
      {}; // user id, list of posts where each post is a map of post id and post content, & timestamp
  int _postCount = 0;

  Instagram() {
    print("Welcome to Instagram");
  }

  List _getUserIds() => _userMeta.keys.toList();
  bool _userExists(int userId) => _getUserIds().contains(userId);
  List _getFollowers(int userId) => _userMeta[userId]["followers"];

  void newUser(int userId) {
    stdout.write("Enter your username: ");
    _userMeta[userId] = {
      "username": stdin.readLineSync(),
      "following": <int>[],
      "followers": <int>[],
    };
    _posts[userId] = [];
    print("Hello ${_userMeta[userId]["username"]}");
  }

  void post(int userId, int postId) {
    if (!_userExists(userId)) {
      print("User with id $userId does not exist");
      return;
    }

    print("Type your post below:");
    _posts[userId]!.add({
      "postId": postId,
      "timestamp": ++_postCount,
      "content": stdin.readLineSync(),
    });
  }

  void follow(int followerId, int followingId) {
    if (!_userExists(followerId)) {
      print("User with id $followerId does not exist");
      return;
    }
    if (!_userExists(followingId)) {
      print("User with id $followingId does not exist");
      return;
    }

    if (_getFollowers(followingId).contains(followerId)) {
      print("You are already following this user");
    } else {
      _userMeta[followerId]["following"].add(followingId);
      _userMeta[followingId]["followers"].add(followerId);
      print(
          "${_userMeta[followerId]["username"]} is now following ${_userMeta[followingId]["username"]}");
    }
  }

  void unfollow(int followerId, int followingId) {
    if (!_userExists(followerId)) {
      print("User with id $followerId does not exist");
      return;
    }
    if (!_userExists(followingId)) {
      print("User with id $followingId does not exist");
      return;
    }

    if (!_getFollowers(followingId).contains(followerId)) {
      print("You are not following this user");
    } else {
      _userMeta[followerId]["following"]!.remove(followingId);
      _userMeta[followingId]["followers"]!.remove(followerId);
      print(
          "${_userMeta[followerId]["username"]} is no longer following ${_userMeta[followingId]["username"]}");
    }
  }

  void getFeed(int userId) {
    if (!_userExists(userId)) {
      print("User with id $userId does not exist");
      return;
    }

    List<int> following = _userMeta[userId]["following"];
    List<Map<String, dynamic>> feed = [];

    for (int user in following) {
      _posts[user]!
          .forEach((post) => post["username"] = _userMeta[user]["username"]);
      feed.addAll(_posts[user]!);
    }

    feed.sort((a, b) => b["timestamp"].compareTo(a["timestamp"]));

    print("Feed for ${_userMeta[userId]["username"]}");
    for (Map<String, dynamic> post in feed) {
      print("Post by ${post["username"]}:\n${post["content"]}");
    }
  }
}

void main() {
  Instagram instance = Instagram();
  instance.newUser(1);
  instance.newUser(2);

  instance.post(1, 1);
  instance.post(1, 2);
  instance.post(2, 1);
  instance.post(2, 2);

  instance.follow(1, 2);

  instance.getFeed(1);

  instance.unfollow(1, 2);
}
