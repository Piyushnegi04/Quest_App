import 'package:flutter/material.dart';
import 'package:quest/constants/colour.dart';
import 'package:quest/screens/data_loader.dart';
import 'package:quest/screens/quest_list.dart';
import 'models.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  int _selectedIndex = -1; // Track the currently selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wisdom Nugget's",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            fontSize: 28,
            color: CustomColor.yellowPrimary,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.4, // Set opacity for the background image
              child: Image.asset(
                'assets/avatar.png', // Path to your background image
                fit: BoxFit.cover, // Cover the whole screen
                alignment: Alignment.center,
              ),
            ),
          ),
          // Main content with footer
          Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Category>>(
                  future: loadCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No categories available.'));
                    } else {
                      final categories = snapshot.data!;
                      return ListView.separated(
                        itemCount: categories.length,
                        separatorBuilder: (context, index) => Divider(
                          color:
                              Colors.grey.shade300, // Line color for separation
                          thickness: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              categories[index].name,
                              style: const TextStyle(
                                color: CustomColor
                                    .whitePrimary, //edit the quest categries in home screen.
                                fontSize: 18,
                              ),
                            ),
                            tileColor: _selectedIndex == index
                                ? Colors.grey[200]
                                : Colors
                                    .transparent, // Background color based on selection
                            onTap: () {
                              setState(() {
                                _selectedIndex = index; // Update selected index
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuestListScreen(
                                      category: categories[index]),
                                ),
                              ).then((_) {
                                setState(() {
                                  _selectedIndex =
                                      -1; // Reset selection when returning
                                });
                              });
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              // Footer with text
              Container(
                color: Colors.black
                    .withOpacity(0.7), // Background color for footer
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: const Text(
                  'Made by AVI',
                  style: TextStyle(
                    color: CustomColor.hintTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
