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

 Week 1
- Login Screen  
- Signup Screen  
- Home Screen  

 Week 2
- Counter App  
- Todo App (Local State)  

 Week 3
- Complete Task Manager  

🛠️ Built With

- Flutter  
- Dart  
- Material UI  
- Responsive Layout  
  
Week 4 
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
