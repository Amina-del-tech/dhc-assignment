
import 'package:my_flutter_journey/screens/week1/login_screen.dart';
import 'package:my_flutter_journey/screens/week1/signup_screen.dart';
import 'package:my_flutter_journey/screens/week2/counter_app_screen.dart';
import 'package:my_flutter_journey/screens/week2/todo_app_screen.dart';
import 'package:my_flutter_journey/screens/week3/task_manager_screen.dart';

class WeekTaskData {
  static List<Map<String, dynamic>> week1Screens = [
    {
      "title": "Login Screen",
      "description": "Build a login screen with two TextFormFields for email and password. Add a button for login and a Text widget for 'Forgot Password?'. Learn basic UI structure with Column, Row, Container and implement navigation to Home Screen.",
      "screen": const LoginScreen(),
    },
    {
      "title": "Signup Screen",
      "description": "Build a signup screen with proper form validation. Include fields for name, email, and password. Ensure validations for email format and non-empty fields. Add a signup button and navigate to Home Screen on success.",
      "screen": const SignupScreen(),
      
    },
  ];

  static List<Map<String, dynamic>> week2Screens = [
    {
      "title": "Counter App",
      "description": "Create a simple counter app using setState. Implement Increment and Decrement buttons. Save the counter value locally using SharedPreferences so that the value persists across app restarts.",
      "screen": const CounterAppScreen(),
    },
    {
      "title": "Todo App",
      "description": "Build a to-do list app where users can add, display, and delete tasks. Save tasks locally using SharedPreferences. Tasks should persist even when the app is closed and reopened.",
      "screen": const TodoScreen(),
    },
  ];

  static List<Map<String, dynamic>> week3Screens = [
    {
      "title": "Task Manager",
      "description": "Final project: Create a functional task management app. Features include adding, deleting, and marking tasks as complete. Persist tasks locally using SharedPreferences. Test navigation and data saving. Include a custom app bar with action button for adding tasks and use Icons for visual appeal.",
      "screen": const TaskManagerScreen(),
    },
  ];
}