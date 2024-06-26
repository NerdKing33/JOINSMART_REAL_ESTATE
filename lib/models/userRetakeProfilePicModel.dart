class userRetakeProfilePicsModel {
  final String profilePic;
  final String uid;
  userRetakeProfilePicsModel({
    required this.profilePic,
    required this.uid
  });
  Map<String, dynamic> retakeMapper() =>
      {
        'profilePic': profilePic,
        'uid': uid
      };
}
