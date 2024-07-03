class userNewEmailModel {
  final String userEmail;
  final String uid;
  userNewEmailModel({
    required this.userEmail,
    required this.uid
  });
  Map<String, dynamic> emailMapper() =>
      {
        'userEmail': userEmail,
        'uid': uid
      };
}
