import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_journey/provider/task_provider.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class TodoScreen2 extends StatefulWidget {
  const TodoScreen2({super.key});

  @override
  State<TodoScreen2> createState() => _TodoScreen2State();
}

class _TodoScreen2State extends State<TodoScreen2>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _fabController;

  @override
  void initState() {
    super.initState();
    _fabController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  void _showAddTaskDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final provider = Provider.of<TaskProvider>(context, listen: false);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Add Task",
      pageBuilder: (_, __, ___) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Add New Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                prefixIcon: const Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Description",
                prefixIcon: const Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.trim().isEmpty) return;

              // Add task to provider
              provider.addTask(
                titleController.text.trim(),
                descController.text.trim(),
              );

              // Animate new item insertion
              _listKey.currentState!.insertItem(
                provider.tasks.length - 1,
                duration: const Duration(milliseconds: 400),
              );

              // Close dialog immediately
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.success,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Save"),
          ),
        ],
      ),
      transitionBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  void _showTaskDetail(String title, String description) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description.isEmpty ? "No description" : description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _removeWithAnimation(int index) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    final removedTitle = provider.tasks[index].title;
    final removedDesc = provider.tasks[index].description;

    _listKey.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: _buildTaskTile(removedTitle, removedDesc, index),
        ),
      ),
      duration: const Duration(milliseconds: 400),
    );

    provider.removeTask(index);
  }

  Widget _buildTaskTile(String title, String description, int index) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showTaskDetail(title, description),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(title),
          subtitle: Text(description.isEmpty ? "No description" : description),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeWithAnimation(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Week 6 Todo App"),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle:
            const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 6,
        backgroundColor: AppColors.primary,
      ),
        
        
      body: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          if (provider.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list_alt, size: 80, color: AppColors.primary),
                  const SizedBox(height: 16),
                  Text(
                    "No Tasks Yet",
                    style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Tap + to add a new task",
                    style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }

          return AnimatedList(
            key: _listKey,
            initialItemCount: provider.tasks.length,
            itemBuilder: (context, index, animation) {
              final task = provider.tasks[index];
              return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: _buildTaskTile(task.title, task.description, index),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(_fabController),
        child: FloatingActionButton(
          onPressed: () async {
            await _fabController.forward();
            await _fabController.reverse();
            _showAddTaskDialog();
          },
          backgroundColor: AppColors.primaryLight,
          child: const Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),
    );
  }
}