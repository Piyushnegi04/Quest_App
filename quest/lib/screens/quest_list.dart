import 'package:flutter/material.dart';
import 'package:quest/constants/colour.dart';
import 'package:quest/screens/models.dart';
import 'package:quest/screens/quest_detail.dart';

class QuestListScreen extends StatelessWidget {
  final Category category;

  QuestListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: CustomColor.yellowSecondary,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/avatar.png', // Path to your background image
                fit: BoxFit.cover, // Cover the whole screen
              ),
            ),
          ),
          // Overlay list content
          ListView.separated(
            itemCount: category.quests.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade300, // Line color for separation
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            itemBuilder: (context, index) {
              final quest = category.quests[index];
              return ListTile(
                title: Text(
                  quest.description,
                  style: const TextStyle(
                    color: CustomColor.whiteSecondary, //edit the quest list
                  ),
                  maxLines: 1,
                  //maxCharacter: 10 ,
                  overflow:
                      TextOverflow.ellipsis, // Truncate text with ellipsis
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestDetailScreen(
                        quests: category.quests,
                        currentIndex: index,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
