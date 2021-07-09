enum TYPE { normal, verify, hashTag }

class Suggestion {
  final String imagePath;
  final String nickName;
  final String account;
  final TYPE type;
  final bool isFollowing;

  Suggestion(
      this.imagePath, this.nickName, this.account, this.type, this.isFollowing);
}
