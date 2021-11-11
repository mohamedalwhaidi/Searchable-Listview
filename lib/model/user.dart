class User {
  String name;
  String userName;
  String image;
  bool isFollowedByMe;

  void toggleFollowUser() => isFollowedByMe = !isFollowedByMe;

  User(this.name, this.userName, this.image, this.isFollowedByMe);
}
