import 'package:flutter/material.dart';
import 'package:quest/constants/colour.dart';
import 'models.dart';

// quest_detail_screen.dart

class QuestDetailScreen extends StatelessWidget {
  final List<Quest> quests;
  final int currentIndex;

  QuestDetailScreen({required this.quests, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // Get the current quest based on the current index
    final Quest quest = quests[currentIndex];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Horizontal padding
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            mainAxisSize: MainAxisSize.min, // Minimize the size of the column
            children: [
              Flexible(
                child: Text(
                  quest.description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: CustomColor.whitePrimary,
                    fontStyle: FontStyle.italic,
                    height: 1,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: CustomColor.whiteSecondary,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Center text alignment
                ),
              ),
              const SizedBox(height: 60),
              // Centered row of navigation buttons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  // Show the back button if there is a previous quest
                  if (currentIndex > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestDetailScreen(
                              quests: quests,
                              currentIndex: currentIndex - 1,
                            ),
                          ),
                        );
                      },
                    ),
                  // Show the forward button if there is a next quest
                  if (currentIndex < quests.length - 1)
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestDetailScreen(
                              quests: quests,
                              currentIndex: currentIndex + 1,
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
