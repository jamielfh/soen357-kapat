# soen357-kapat

Frontend application for KaPat Financial Planning App using Flutter.

### Prerequisites

1. Flutter
- Download Flutter, follow this guide [Flutter installation](https://docs.flutter.dev/get-started/install)
- Run `flutter doctor -v` in your terminal to troubleshoot and install any other dependencies.

2. Android Studio
- Download Android Studio, follow this guide [Android studio installation](https://developer.android.com/studio/install)
- Install Flutter and Dart plugins. 
- Add sdk path for dart to android studios
- Create Virtual Device. Virtual Device Manager --> Create device

3. Clone the Comcrop repository from Github

4. For Windows Computers:
- Turn on developer mode for window computers (Settings->Privacy & Security -> Developer Mode (turn on))

5. minsdkVersion: If you are facing issues when starting the main.dart file, change this line in the build.gradle file (file path: frontend > android > app > build.gradle, this is *NOT* the same file as frontend > android > build.gradle ):

Inside default config:
set minsdkVersion = 20 (or higher)
Before:
![minSdkVersion localProperties.getPropery(...)](assets/minSdkVersionBefore.png)

After:
![minSdkVersion = 20](assets/minSdkVersionAfter.png)


### File Directory
```
frontend/
├── README.md
├── android                                         // Android settings
├── assets                                          // Images used in application
├── lib
│   └── main.dart
└── etc.
```

### Deployment
- Open your IDE

#### Deploy application
``` 
ANDROID STUDIO
# Open project
Open --> [Path to Comcrop/frontend]

# Activate virtual device
Start Emulator

# Run app
Press the green arrow at the top right

VSCode (ALTERNATIVE)
# Install Extensions
Extensions --> install Flutter, Dart

# Open Project
cd KaPat/flutter

# Activate virtual device
1. cmd + shift + p (Mac) / ctrl + shift + p (Windows)
2. Search "Flutter: Launch Emulator"
3. Select your virtual device created from Android Studio

# Run app
1. Type `flutter run` in terminal OR open main.dart and press the arrow on the top right
```