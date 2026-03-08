import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter_journey/provider/task_provider.dart';
import 'package:my_flutter_journey/screens/models/task_model.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({super.key});

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _fabController;

  // Priority & Tag
  String _selectedPriority = 'Medium';
  String _selectedTag = 'Personal';

  final List<String> _priorityOptions = ['High', 'Medium', 'Low'];
  final List<String> _tagOptions = ['Work', 'Personal', 'School'];

  @override
  void initState() {
    super.initState();
    _fabController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _fabController.dispose();
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _showTaskDialog({Task? task, int? index}) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    if (task != null) {
      _titleController.text = task.title;
      _descController.text = task.description;
      _selectedPriority = task.priority;
      _selectedTag = task.tag;
    } else {
      _titleController.clear();
      _descController.clear();
      _selectedPriority = 'Medium';
      _selectedTag = 'Personal';
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(task != null ? "Edit Task" : "Add Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const SizedBox(height: 12),
            // Priority Dropdown
            DropdownButtonFormField<String>(
              value: _selectedPriority,
              items: _priorityOptions
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedPriority = val!),
              decoration: const InputDecoration(labelText: 'Priority'),
            ),
            const SizedBox(height: 12),
            // Tag Dropdown
            DropdownButtonFormField<String>(
              value: _selectedTag,
              items: _tagOptions
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedTag = val!),
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(backgroundColor: Colors.grey[600]),
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              if (_titleController.text.trim().isEmpty) return;

              if (task != null && index != null) {
                provider.updateTaskWithExtras(
                    index,
                    _titleController.text.trim(),
                    _descController.text.trim(),
                    _selectedPriority,
                    _selectedTag);
              } else {
                provider.addTaskWithExtras(
                    _titleController.text.trim(),
                    _descController.text.trim(),
                    _selectedPriority,
                    _selectedTag);
                _listKey.currentState!.insertItem(
                    provider.tasks.length - 1,
                    duration: const Duration(milliseconds: 400));
              }

              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: AppColors.success),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSettings(TaskProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: const Text("Dark Mode", style: TextStyle(color: Colors.black)),
                value: provider.isDarkMode,
                onChanged: (val) {
                  provider.toggleDarkMode(val);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Clear All Tasks", style: TextStyle(color: Colors.black)),
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                onTap: () {
                  provider.clearAllTasks();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildTaskTile(Task task, int index) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    return Dismissible(
      key: Key(task.title + index.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text("This task will be deleted permanently."),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Delete", style: TextStyle(color: Colors.red))),
            ],
          ),
        );
      },
      onDismissed: (_) {
        final removedTask = provider.tasks[index];
        provider.removeTask(index);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Task deleted"),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                provider.addTaskWithExtras(
                    removedTask.title,
                    removedTask.description,
                    removedTask.priority,
                    removedTask.tag);
              },
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        color: provider.isDarkMode ? Colors.grey[850] : Colors.white,
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (val) => provider.toggleTaskCompletion(index),
            activeColor: AppColors.primary,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(
                      color: provider.isDarkMode ? Colors.white : Colors.black,
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    color: _getPriorityColor(task.priority),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  task.priority,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          subtitle: task.description.isNotEmpty
              ? Text(task.description,
                  style: TextStyle(
                      color: provider.isDarkMode ? Colors.white70 : Colors.grey[700]))
              : null,
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _showTaskDialog(task: task, index: index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDarkMode ? Colors.grey[900] : Colors.grey[200],
      appBar: AppBar(
        title: const Text("Task Management", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () => _showSettings(provider)),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          if (provider.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.list_alt, size: 80, color: Colors.blueGrey),
                  SizedBox(height: 12),
                  Text("No tasks yet.", style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
                  Text("Tap + to add a new task.", style: TextStyle(color: Colors.blueGrey, fontSize: 14),),
                
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
                position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                    .animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: _buildTaskTile(task, index),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: Tween<double>(begin: 0.9, end: 1.0).animate(_fabController),
        child: FloatingActionButton(
          onPressed: () async {
            await _fabController.forward();
            await _fabController.reverse();
            _showTaskDialog();
          },
          backgroundColor: AppColors.primaryLight,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}