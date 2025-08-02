class Notes {
  final String title;
  final String description;

  Notes({required this.title, required this.description});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }
}
