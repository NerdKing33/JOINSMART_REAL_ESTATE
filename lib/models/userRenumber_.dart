class userRenumberModel {
  final String userNumber;
  final String uid;
  userRenumberModel({
    required this.userNumber,
    required this.uid
  });
  Map<String, dynamic> renumberMapper() =>
      {
        'userNumber': userNumber,
        'uid': uid
      };
}
