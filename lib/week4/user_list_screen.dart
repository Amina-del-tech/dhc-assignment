import 'package:flutter/material.dart';
import 'package:my_flutter_journey/screens/models/user_response_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_journey/utils/app_colors.dart';
import 'package:my_flutter_journey/week4/user_profile_screen.dart';
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // 🔹 Array to store all users
  List<UserResponseModel> users = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
Future<void> fetchUsers() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {
        'Accept': 'application/json', // Add this header
        'User-Agent': 'FlutterApp',    // Optional, helps some servers
      },
    );

    

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      users = jsonList
          .map((json) => UserResponseModel.fromJson(json))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        errorMessage = 'Status Code: ${response.statusCode}';
      });
    }
  } catch (e) {
    print("Exception: $e");
    setState(() {
      isLoading = false;
      errorMessage = e.toString();
    });
  }
}

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        body: Center(child: Text('Error: $errorMessage')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users "),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.week4Gradient[0],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name ?? 'No Name'),
            subtitle: Text(user.email ?? 'No Email'),
           leading: CircleAvatar(
  radius: 25,
  backgroundImage:
      NetworkImage("https://i.pravatar.cc/150?u=${user.id}"),
  backgroundColor: Colors.grey.shade200,
),
            onTap: () {
              // 🔹 Navigate to profile screen with array + selected index
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                    users: users,
                    selectedIndex: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}