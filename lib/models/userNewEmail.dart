class userNewEmailModel {
  final String email;
  final String uid;
  userNewEmailModel({
    required this.email,
    required this.uid
  });
  Map<String, dynamic> emailMapper() =>
      {
        'email': email,
        'uid': uid
      };
}
