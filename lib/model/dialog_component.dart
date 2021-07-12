enum DialogType { Basic, SimpleOptions, MultiOptions, Bottom}

class DialogComponent {
  final String? title;
  final String? description;
  final List<String> options;
  final DialogType type;

  DialogComponent(
      {this.title,
      this.description,
      required this.options,
      required this.type});
}
