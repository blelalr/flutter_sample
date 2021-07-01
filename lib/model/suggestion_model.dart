enum TYPE { normal, verify, hashTag }

class SuggestionModel {
  final String imagePath;
  final String nickName;
  final String account;
  final TYPE type;
  final bool isFollowing;

  SuggestionModel(
      this.imagePath, this.nickName, this.account, this.type, this.isFollowing);
}
