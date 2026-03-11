DHC-Assignment-1

A fully responsive Flutter application showcasing modern UI/UX, authentication screens,  navigation, and reusable widgets. Built with clean architecture and optimized layout  to work smoothly across different screen sizes.
# My Flutter Journey 🚀

A clean and responsive Flutter application built as part of my learning journey.  
This project demonstrates modern UI design, responsive layout, navigation, and basic state management using Flutter.

 ✨ Features

- Login UI with validation  
- Signup Screen  
- Responsive Dashboard  
- Weekly Task Based Structure  
- Clean UI & Reusable Widgets  
- Navigation between screens  
- Basic State Management  
- Local UI optimization  

📱 Screens Included

 # 💻Week 1
- Login Screen  
- Signup Screen  
- Home Screen  

 # 💻Week 2
- Counter App  
- Todo App (Local State)  

 # 💻Week 3
- Complete Task Manager  

🛠️ Built With

- Flutter  
- Dart  
- Material UI  
- Responsive Layout  
  
# 💻Week 4 
- REST API Integration in Flutter

📚 Project Overview

In Week 4, we implemented REST API integration in a Flutter application. The goal was to fetch user data from an external API and display it in a structured UI with navigation to a detailed user profile.

🛠Features Implemented

- API Integration
- Fetched data from JSONPlaceholder Users API
- Parsed JSON into Dart objects using a custom UserResponseModel class.

User List Screen

- Displayed all users in a ListView.
- Each user has a circular avatar, name, and email.
- Tapping a user navigates to the profile screen.

User Profile Screen

- Shows detailed information: name, username, email, phone, website.
- Includes a circular avatar generated via https://i.pravatar.cc/150?u={user.id}.
- All user info is centered on the screen for better readability.

Error Handling & Loading States

- Displayed CircularProgressIndicator while fetching data.
- Proper error messages if API fails or returns non-200 status codes.

Navigation

- Used Flutter’s Navigator to move from user list to profile screen.
- Passed the entire users array along with the selected index to the profile screen.

Packages Used

- http – For REST API requests.
- flutter/material.dart – UI components.

# 💻Week 5 – Profile Screen with Firebase
Overview

In Week 5, the focus was on implementing a Profile Screen in the Flutter application. This screen allows a logged-in user to view their personal information, including:

- Profile Picture
- Full Name
- Email
- Phone Number (from Firestore)

The data is stored in Firebase Firestore and authentication is handled via Firebase Authentication. The UI is designed to be modern, clean, and responsive.

🔹 Firebase Packages Used (Week 5)

1. firebase_core

- Purpose: Initializes Firebase in the Flutter app.
- Version: ^2.25.0

2. firebase_auth

- Purpose: Handles user authentication (signup, login, logout).
- Version: ^4.6.3

3. cloud_firestore

- Purpose: Stores and fetches user data (name, email, phone).
- Version: ^5.3.0

🔹 Setup Instructions

- Add the packages to pubspec.yaml and run:
- flutter pub get
- Initialize Firebase in main.dart before running the app:

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
These packages allow secure authentication and real-time access to user data in Firestore for the profile screen.

Purpose

- The purpose of Week 5 is to:
- Learn how to fetch user data from Firebase Firestore.
- Display user information in a visually appealing UI.
- Handle user authentication and logout flow.
- Apply responsive design principles in Flutter.
- Understand modular code structure and FutureBuilder usage for async data fetching.

Features

- Fetch user data from Firebase Firestore in real-time.
- Display user profile details: Name, Email, Phone.
- Default avatar is displayed if the user does not have a profile picture.
- Gradient header with circular avatar for a modern UI.
- Account info displayed in cards for readability.
- Logout button with small, clean design.
- Scrollable layout for smaller screens.
- Handles cases where no data exists or the user is not logged in.

 UI Flow
User Registration (Signup Screen)
        │
        ▼
  Firebase Authentication
        │
        ▼
  Firestore "users" Collection
(Name, Email, Phone stored)
        │
        ▼
  Profile Screen (Week 5)
  ├─ Header with gradient & avatar
  ├─ Name & Email displayed
  ├─ Info cards: Name, Email, Phone
  └─ Logout button

Explanation:

- After signup/login, user data is stored in Firestore.
- Profile Screen fetches data asynchronously using FutureBuilder.
- UI updates automatically when user data is available.

# Week 6 – Flutter Task Management App (Provider, Settings, Dark Mode & Animations)

## Overview

In **Week 6**, the Flutter Task Management application was enhanced by implementing **Provider for state management** along with additional features such as **task editing, settings screen, dark mode, and UI animations**. The goal was to build a more structured and interactive application while keeping the business logic separate from the user interface.

The application allows users to **add, view, edit, and delete tasks**, as well as customize the application appearance through **dark mode settings**.

## Features Implemented

### Task Management

Users can manage tasks with the following functionalities:

* **Add Task** – Users can create new tasks by entering a title and description through a dialog form.
* **View Task Details** – Tapping a task opens a dialog showing the full task details.
* **Edit Task** – Existing tasks can be edited, allowing users to update the title or description.
* **Delete Task** – Tasks can be removed with a confirmation dialog to prevent accidental deletion.

### Provider State Management

The application uses **Provider** to manage the state of tasks.

A `TaskProvider` class extends `ChangeNotifier` and stores the task list. It includes methods for:

* Adding tasks
* Editing tasks
* Deleting tasks

Whenever the task list changes, the provider notifies the UI using **notifyListeners()**, and the UI automatically rebuilds using **Consumer widgets**.

### Settings Screen

A dedicated **Settings screen** was implemented to manage application preferences and customization options.

### Dark Mode

The app includes **Dark Mode support**, allowing users to toggle between **Light Theme and Dark Theme** from the settings screen. The theme updates dynamically across the entire application.

### Animations

Basic **UI animations** were implemented to improve the overall user experience and make interactions smoother.

### Empty Task State

When there are no tasks available, the application displays a friendly message such as **“No Tasks Yet”** with an icon and instruction to add a new task.

## Project Structure

The project follows a structured architecture for better scalability and maintainability:

* **Models** – Defines the task data structure
* **Providers** – Manages application state using Provider
* **Screens** – Includes TodoScreen, SettingsScreen, SplashScreen, etc.
* **Widgets** – Reusable components such as TaskTile
* **Utils** – Helper classes like AppColors

## Technologies Used

* Flutter (Dart)
* Provider (State Management)
* Material UI Components
* Theme Management (Light/Dark Mode)
* Custom Widgets
* UI Animations

## Learning Outcomes

During this week, the following concepts were practiced:

* Implementing **Provider-based state management**
* Structuring Flutter applications using models, providers, and widgets
* Managing application-wide themes (Dark Mode)
* Creating a **settings screen**
* Implementing **task editing functionality**
* Adding basic UI animations

## Conclusion

Week 6 focused on building a more scalable Flutter application by implementing **Provider state management**, **task editing**, **theme customization**, and **animations**. These improvements made the application more interactive, user-friendly, and maintainable.

Future improvements may include:

* Task completion tracking
* Notifications and reminders
* Cloud database integration (Firebase)
* Advanced animations and UI improvements



📂 Project Structure

lib/
 ├── screens/
 ├── widgets/
 ├── data/
 ├── utils/
 └── main.dart

 🎯 Purpose
  
- This project was created for learning Flutter development, improving UI design skills, and understanding app structure with clean code.This project demonstrates how to fetch and display data from a REST API in a Flutter app. It teaches JSON parsing, error handling, and navigation between a user list and detailed profile screens.

👩‍💻 Author

Amina Fiaz 
