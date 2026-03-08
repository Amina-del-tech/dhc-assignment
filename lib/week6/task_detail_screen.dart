import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_journey/provider/task_provider.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class TaskDetailScreen extends StatefulWidget {
  final int taskIndex;

  const TaskDetailScreen({super.key, required this.taskIndex});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    final task = Provider.of<TaskProvider>(context, listen: false)
        .tasks[widget.taskIndex];
    _titleController = TextEditingController(text: task.title);
    _descController = TextEditingController(text: task.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    final task = provider.tasks[widget.taskIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              value: task.isDone,
              onChanged: (val) {
                provider.toggleTaskCompletion(widget.taskIndex);
              },
              title: const Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    provider.removeTask(widget.taskIndex);
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.updateTask(
                      widget.taskIndex,
                      _titleController.text.trim(),
                      _descController.text.trim(),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}