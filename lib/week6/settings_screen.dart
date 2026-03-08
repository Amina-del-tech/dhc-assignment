import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_journey/provider/task_provider.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Clear all tasks
            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text("Clear All Tasks"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text(
                        "This will remove all tasks permanently."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          provider.clearAllTasks();
                          Navigator.pop(context);
                        },
                        child: const Text("Clear", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Dark / Light mode toggle (example only)
            ListTile(
              leading: const Icon(Icons.brightness_6, color: Colors.orange),
              title: const Text("Toggle Dark Mode"),
              onTap: () {
                // Toggle theme logic here (optional)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Theme toggled!")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}