class userRenameModel {
  final String username;
  final String uid;
  userRenameModel({
    required this.username,
    required this.uid
  });
  Map<String, dynamic> renameMapper() =>
      {
        'username': username,
        'uid': uid
      };
}
