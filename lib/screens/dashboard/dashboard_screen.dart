import 'package:flutter/material.dart';
import 'package:my_flutter_journey/data/week_task_data.dart';
import 'package:my_flutter_journey/screens/widgets/week_card.dart';
import 'package:my_flutter_journey/screens/widgets/week_screens_list_dart';
import 'package:my_flutter_journey/utils/app_colors.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            WeekCard(
              title: "Week 1",
              subtitle:
                  "In this week we built Login & Signup with validation and navigation. Students learned basic UI building, navigation, and form validation in Flutter.",
              icon: Icons.looks_one,
              gradientColors: AppColors.week1Gradient,
              margin: const EdgeInsets.only(bottom: 12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekScreensList(
                    weekTitle: "Week 1",
                    weekDescription:
                        "In this week we built Login & Signup with validation and navigation. Students learned basic UI building, navigation, and form validation in Flutter.",
                    screens: WeekTaskData.week1Screens,
                  ),
                ),
              ),
            ),
            WeekCard(
              title: "Week 2",
              subtitle:
                  "We created Counter App and Todo App using state management and SharedPreferences. Students practiced managing state, saving data locally, and building interactive UIs.",
              icon: Icons.looks_two,
              gradientColors: AppColors.week2Gradient,
              margin: const EdgeInsets.only(bottom: 12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekScreensList(
                    weekTitle: "Week 2",
                    weekDescription:
                        "We created Counter App and Todo App using state management and SharedPreferences. Students practiced managing state, saving data locally, and building interactive UIs.",
                    screens: WeekTaskData.week2Screens,
                  ),
                ),
              ),
            ),
            WeekCard(
              title: "Week 3",
              subtitle:
                  "Built full Task Manager with add/delete/complete functionality and persistence using SharedPreferences. Students learned to combine all previous concepts into a complete project.",
              icon: Icons.looks_3,
              gradientColors: AppColors.week3Gradient,
              margin: const EdgeInsets.only(bottom: 12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekScreensList(
                    weekTitle: "Week 3",
                    weekDescription:
                        "Built full Task Manager with add/delete/complete functionality and persistence using SharedPreferences. Students learned to combine all previous concepts into a complete project.",
                    screens: WeekTaskData.week3Screens,
                  ),
                ),
              ),
            ),
            WeekCard(
              title: "Week 4",
              subtitle:
                  "Implemented REST API integration using http package. Learned JSON parsing, FutureBuilder, loading indicators, and error handling.",
              icon: Icons.looks_4,
              gradientColors:
                  AppColors.week4Gradient, // create this in app_colors
              margin: const EdgeInsets.only(bottom: 12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekScreensList(
                    weekTitle: "Week 4",
                    weekDescription:
                        "Implemented REST API integration using http package. Learned JSON parsing, loading states, and error handling.",
                    screens: WeekTaskData.week4Screens,
                  ),
                ),
              ),
            ),
            WeekCard(
              title: "Week 5",
              subtitle:
                  "Implemented Firebase Authentication for user registration and login. Learned to integrate Firebase services into Flutter apps.",
              icon: Icons.looks_5,
              gradientColors:
                  AppColors.week5Gradient, 
              margin: const EdgeInsets.only(bottom: 12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekScreensList(
                    weekTitle: "Week 5",
                    weekDescription:
                        "Implemented Firebase Authentication for user registration and login. Learned to integrate Firebase services into Flutter apps.",
                    screens: WeekTaskData.week5Screens,
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
