# FLUTTER NOTES APP
A simple and intuitive notes application built with Flutter that allows users to create, read, update, and delete notes with local data persistence.
# Technology Used
Flutter - UI framework
Dart - Programming Language
shared_preferences (v2.2.2) - Local data storage
intl (v0.18.1) - Date and time formatting
uuid (v4.3.3) - Unique ID generation

# FEATURES
Create new notes with title and content
View all notes in a scrollable list
Edit existing notes
Delete notes with confirmation dialog
Automatic timestamps (created and last updated)
Data persists after app restart

# INSTALLATION AND SETUP
PREREQUISITES
Make sure you have these installed:
  Flutter SDK (version 3.0 or higher)
  Android Studio or VS Code with Flutter extension
  Git

To check if Flutter is installed":
`flutter --version`

if not installed follow the flutter link `https://docs.flutter.dev/get-started`
Step by step Setup
1. Clone a project that you created from github
   `
   git clone https://github.com/yourusername/notes_app.git
   cd notes_app
   `
2. Create a project on VS CODE IDE
   `
    flutter create notes_app
    cd notes_app
   `
3. Add Dependencies
   Open `pubspec.yaml` and add these packages under `dependencies`:
   `
    dependencies:
      flutter:
        sdk: flutter
      shared_preferences: ^2.2.2
      intl: ^0.18.1
      uuid: ^4.3.3
   `
   4. Install Packages
      - Run the command  below in your terminal
        `
          flutter pub get
        `
   5. Create Project Structure
      Create the folders and files to write code inside the `lib` directory
      <img width="429" height="310" alt="image" src="https://github.com/user-attachments/assets/056bd949-5d72-466c-b9e6-d4550a9462ae" />
   6. Write the code needed in each file
          `main.dart` - App entry point
          `models/note.dart` - Note data model
          `services/storage_service.dart` - Storage operations
          `services/storage_service.dart` - Main screen
          `screens/add_note_screen.dart` - Create note screen
          `screens/edit_note_screen.dart `- Edit note screen
          `screens/edit_note_screen.dart ` - Note display widget
   7.Verify Setup
      Check that everything is ready:
      `flutter doctor`
      All items should have green checkmarks. If you see any warnings or            errors, follow the suggested fixes.

   # RUNNING THE APPLICATION
   On the Android Emulator
   1. Start Android Emulator
      Open Android Studio
      Click on "AVD Manager"
      Select an emulator and click "Play"
   2. Run the App
      `Flutter run`
   On Physical Device
   1. Enable USB Debugging (Android) or Developer Mode (iOS)
   2. Connect device via USB
   3. Check device is detected:
      `flutter devices`
   4. Run the app:
      `flutter run`
   5. Select Specific Device
      If you have multiple devices connected:
      `
        # List all devices
          flutter devices
          
        # Run on specific device
          flutter run -d <device_id>
      `
   6. Expected Output
   `
   ✓ Built build/app/outputs/flutter-apk/app-debug.apk.
    Installing app...
    Launching lib/main.dart on Android SDK built for x86 in debug mode...
    Running Gradle task 'assembleDebug'...
    ✓ Built build/app/outputs/flutter-apk/app-debug.apk in 45.3s
   `
   # USAGE OF THE APP
   # irst Launch

    Empty screen shows "No notes yet. Tap + to create one"
    Console confirms storage is working
    
    1 Creating Notes
    
    a. Tap + button (bottom right)
    b. Enter title and content
    c. Tap Save Note
    
    2. Viewing Notes
      All notes display as cards on home screen
      Shows title, preview, timestamp, and delete button
      Sorted by most recent first
    3. Editing Notes
      Tap any note card
      Make changes
      Tap Update Note
    Warning appears if you try to leave without saving
    4. Deleting Notes
      Tap trash icon on note card
      Confirm deletion
      Success message appears
    Extras
      Refresh icon (top right): Reload notes
      Bug icon (top right): View storage debug info

   
