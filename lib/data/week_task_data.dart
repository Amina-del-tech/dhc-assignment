
import 'package:my_flutter_journey/screens/week1/login_screen.dart';
import 'package:my_flutter_journey/screens/week1/signup_screen.dart';
import 'package:my_flutter_journey/screens/week2/counter_app_screen.dart';
import 'package:my_flutter_journey/screens/week2/todo_app_screen.dart';
import 'package:my_flutter_journey/screens/week3/task_manager_screen.dart';
import 'package:my_flutter_journey/week4/user_list_screen.dart';
import 'package:my_flutter_journey/week5/profile_screen.dart';





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

   static List<Map<String, dynamic>> week4Screens = [
    {
      "title": "Users List & Profile",
      "description":
          "Fetch a list of users from JSONPlaceholder API. Display all users in a scrollable list. Tap on any user to view their detailed profile. Navigate between users using Previous/Next buttons.",
      "screen": const UserListScreen(),
    },
  ];
  static List<Map<String, dynamic>> week5Screens = [
  {
    "title": "Firebase Login Screen",
    "description":
        "Build a login screen using Firebase Email/Password Authentication. Validate user input for email format and non-empty password. On successful login, navigate to the User Profile Screen. Handle error messages for invalid credentials.",
    "screen": const LoginScreen(),
  },
  {
    "title": "Firebase Signup Screen",
    "description":
        "Build a signup screen integrated with Firebase Authentication. Include fields for name, email, and password with proper validation. On successful signup, store user details (name & email) in Firestore and navigate to the User Profile Screen.",
    "screen": const SignupScreen(),
  },
  {
    "title": "User Profile Screen",
    "description":
        "After login/signup, display the user profile with data fetched from Firestore. Show user's name and email. Provide a logout button to sign out from Firebase Authentication.",
    "screen":ProfileScreen(),
  },
];
}