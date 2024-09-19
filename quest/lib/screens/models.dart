// models.dart
class Quest {
  final String description;

  Quest({required this.description});

  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      description: json['description'] as String,
    );
  }
}

class Category {
  final String name;
  final List<Quest> quests;

  Category({required this.name, required this.quests});

  factory Category.fromJson(Map<String, dynamic> json) {
    var questsJson = json['quests'] as List;
    List<Quest> questsList =
        questsJson.map((quest) => Quest.fromJson(quest)).toList();

    return Category(
      name: json['name'] as String,
      quests: questsList,
    );
  }
}
