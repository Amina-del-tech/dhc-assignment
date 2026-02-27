import 'package:flutter/material.dart';
import 'package:my_flutter_journey/screens/models/user_response_model.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class UserProfileScreen extends StatefulWidget {
  final List<UserResponseModel> users;
  final int selectedIndex;

  const UserProfileScreen({
    super.key,
    required this.users,
    required this.selectedIndex,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.users[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.week4Gradient[0],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("https://i.pravatar.cc/150?u=${user.id}"),
            ),
            const SizedBox(height: 12),

            Text(
              user.name ?? 'No Name',
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Center(
              child: Column(
                children: [
                  Text(
                    'Username: ${user.username}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Email: ${user.email}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Phone: ${user.phone}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Website: ${user.website}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}