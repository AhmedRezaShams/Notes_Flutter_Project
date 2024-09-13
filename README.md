# Project Overview
This Flutter project is a simple Notes app that allows users to create, store, and retrieve notes from an Firebase. The app follows an organized architecture (MVC) and includes essential pages for login, registration, home, and note creation. Firebase is used as the backend for storing user data and notes, while state management is handled by the GetX package. GoRouter package is used for navigation.
________________________________________
1. Features
  •	Splash Screen: Displays the app logo with a Welcome text for the first-time launch.
  •	User Authentication:
    o	Login using email and password.
    o	Registration with email, password, and name.
  •	CRUD Operations:
    o	Users can create, read, update, and delete text-based notes.
  •	Online Database: All notes are stored in Firebase Firestore.
  •	Navigation: Managed using the GoRouter package for smooth and organized routing.
  •	State Management: Implemented using the Get package for efficient state handling across the app.
  •	UI/UX: Follows standard practices for a clean and user-friendly interface.
________________________________________
2. Project Architecture
The project follows an MVC (Model-View-Controller) architecture with a clean and maintainable structure:
  •	Model: Handles data-related operations (e.g., Firebase Authentication and Firestore).
  •	View: All dart file represents UI elements(e.g., index.dart, home.dart).
  •	Controller: Handles business logic (e.g., CRUD operations, authentication).
________________________________________
3. Packages Used
  1.	Firebase Core: For initializing Firebase services.
  2.	Firebase Auth: For user authentication.
  3.	Cloud Firestore: For storing and retrieving notes.
  4.	Get: For state management and routing in some cases.
  5.	GoRouter: For navigation management.
  6.	Flutter: Base SDK for app development.
________________________________________


4. Pages Overview
  Splash Screen
    •	Description: The splash screen appears when the app is launched for the first time. It displays the app logo with a text ‘Welcome to Notes’ and then redirects to the       index screen.
    •	Functionality: Utilizes a simple timer and navigates to index screen.
Index Page
    •	Description: The index page show a welcome text with a short description, and two buttons ‘Login’ and ‘Register’
    •	Functionality: Use Go router package to navigate to login or register page.
Login Page
    •	Description: The login screen allows users to log in using their email and password. If the user is not registered, they can navigate to the Registration page.
    •	Functionality: Implements Firebase Authentication to verify user credentials.
Registration Page
    •	Description: The registration screen allows new users to create an account by entering their name, email, and password.
    •	Functionality: Creates a new user account in Firebase Authentication and stores the user's email.
Home Page
    •	Description: The home page shows a list of the user's notes. The user can open a popup screen a floating action button to add new notes.
    •	Functionality:
      o	Fetches notes from Firebase Firestore.
      o	Displays them in a list format.
      o	Allows users to view, edit, or delete notes.
Add Notes Screen
    •	Description: This popup screen allows users to create a new note by entering a title and description.
    •	Functionality:
      o	Saves the note to Firebase Firestore.
      o	Redirects back to the Home Page after successful note creation.
Logout
    •	Description: A logout button is a widget custom button.
    •	Functionality: Implements Firebase Authentication and logout user.
5. Firebase Setup
  1.	Firebase Authentication:
    o	Set up email/password sign-in in Firebase Console.
    o	Register users and sign them in using Firebase Auth methods.
  2.	Firestore Database:
    o	Structure: A collection named notes where each document represents a note with fields like title, content, and createdAt.
________________________________________
6. State Management (Get)
  State management in this app is handled using the Get package, which simplifies reactive state updates and routing.
    •	Reactive State: Observing changes in the user’s login state and note data.
    •	Controllers: AuthController for managing user login/registration and NotesController for handling CRUD operations on notes.
________________________________________
7. Navigation (GoRouter)
  The GoRouter package is used to define and manage app routes:
    •	Splash Route: ‘/’
    •	Login Route: ‘/login’
    •	Registration Route: ‘/register’
    •	Home Route: /home
  The routes are defined centrally and passed to the GetMaterialApp.router configuration.
________________________________________
8. UI/UX Design
  The app follows a simple and clean design:
    •	Login and Registration Pages: Clean form inputs with validation.
    •	Home Page: A list of notes with floating action button for adding new notes.
    •	Add Notes Screen: Simple form with two fields (title, description) and two button like ‘Add’ and ‘Cancel’.
    •	Buttons and Icons: Standard Material buttons and icons to enhance user experience.


10. Conclusion
  This Notes app project demonstrates how to effectively combine Firebase with Flutter to create a fully functional CRUD-based notes app with modern architecture and best        practices. The use of Get for state management and GoRouter for navigation ensures a seamless experience while keeping the codebase clean and maintainable.

