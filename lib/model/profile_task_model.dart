class ProfileTaskModel {
  final String id;
  final String iconPath;
  final String title;
  final String content;
  final String buttonText;
  final bool isComplete;

  ProfileTaskModel(this.id, this.iconPath, this.title, this.content,
      this.buttonText, this.isComplete);
}
