# Agrinova

An AI-powered Smart Agriculture Companion application built with Flutter. Developed as a graduation project, Agrinova integrates on-device Machine Learning for plant disease classification, a voice-activated conversational chatbot with animated Rive avatars, drone/robot hardware controllers, and a secure Firebase cloud backend.

---

## Features

- **On-Device AI Plant Disease Diagnosis**:
  - **Offline Inference**: Classify plant leaf diseases instantly using a custom-trained TensorFlow Lite CNN model (plant_disease_model_cnn.tflite) via the tflite_flutter package.
  - **Disease Classes**: Detects and classifies plant leaf conditions into Healthy, Powdery Mildew, and Leaf Rust.
  - **Image Sourcing**: Capture photos using the device camera or choose existing images from the gallery via the image_picker package.
- **Conversational Voice Chatbot Companion**:
  - **OpenRouter AI Integration**: Conversational assistant powered by the OpenRouter completions API using the Gemma model (google/gemma-4-26b-a4b-it:free).
  - **Speech-to-Text and Text-to-Speech**: Hands-free voice operation using the speech_to_text and flutter_tts packages.
  - **Rive Vector Animations**: Smooth, high-performance interactive companion avatar behaviors powered by the Rive animation engine.
- **Drone and Hardware Dashboards**:
  - **Drone Dashboard**: Visualization of unmanned aerial vehicle (UAV) crop telemetry, featuring NDVI canopy health heatmaps, growth metrics, and harvest countdown progress.
  - **Robot Dashboard**: Unmanned ground vehicle (UGV) telemetry including yield forecasting, soil NPK levels, moisture, and temperature trends.
- **Cloud Backend Integration**:
  - **Authentication Gateway**: Secure user login and registration supporting email/password and Google Sign-In.
  - **Firestore Database**: Live data synchronization for user profile settings, telemetry history, and notification logs.
- **Agricultural Onboarding**:
  - **Introduction Screen**: Engaging onboarding slides introducing core agricultural and AI features to new users.

---

## Tech Stack and Dependencies

Agrinova leverages several state-of-the-art packages:

- **Machine Learning and Image Processing**:
  - `tflite_flutter` - On-device TensorFlow Lite model interpreter.
  - `image` - Image resizing, decoding, and preprocessing utility.
  - `image_picker` - Camera and photo gallery access.
- **State Management**:
  - `provider` - Manages reactive application state, including chat history, user settings, and application themes.
- **AI Conversation and Speech**:
  - `speech_to_text` - Converts user speech inputs into text prompts.
  - `flutter_tts` - Synthesizes chatbot response text into spoken audio.
- **Vector Animations**:
  - `rive` - Renders real-time vector animations for the companion chatbot avatar.
- **Cloud Infrastructure**:
  - `firebase_core` and `cloud_firestore` - Backend services and database connectivity.
  - `firebase_auth` and `google_sign_in` - User credential authentication and federated sign-in.
- **Configuration and Networking**:
  - `flutter_dotenv` - Loads secret environment variables dynamically.
  - `http` - Performs REST API calls to remote AI endpoints.

---

## Project Structure

```text
lib/
├── FirebaseServices/
│   ├── google_sign_in.dart          # Google OAuth authentication service
│   └── profile_services.dart        # Firestore profile synchronization
├── core/
│   ├── ai/
│   │   └── plant_disease_model.dart # On-device TFLite model configuration
│   ├── api/
│   │   ├── chatbot/
│   │   │   ├── Responses.dart       # Structured chat response helpers
│   │   │   ├── chat_message.dart    # Chat message data model
│   │   │   ├── chat_provider.dart   # Chat state management
│   │   │   └── chatbot_api_service.dart # OpenRouter AI chat completion API client
│   │   └── disease_detection/
│   │       └── disease_api_service.dart # Multipart image upload API client (remote fallback)
│   ├── app_theme/
│   │   ├── AppColors.dart           # App-wide color constants
│   │   ├── AppTheme.dart            # Theme configurations (dark mode theme)
│   │   └── app_images.dart          # Asset path references helper
│   ├── repository/
│   │   └── disease_repository.dart  # Data repository mapping layer
│   ├── routes/
│   │   └── AppRoutes.dart           # App navigation routes enum
│   └── widgets/
│       ├── auth/
│       │   └── common_widgets/      # Reusable authentication UI elements
│       └── robot/
│           └── common_widgets/      # Reusable chatbot and Rive UI elements
├── Ui/
│   └── screens/
│       ├── auth_screen/
│       │   └── AuthScreen.dart      # Split entry screen for sign-in options
│       ├── onboarding_screen/
│       │   └── onBoardingScreen.dart # Initial onboarding tutorial slides
│       ├── login_screen/
│       │   └── LoginScreen.dart     # Secure credential sign-in form
│       ├── register_screen/
│       │   └── RegisterScreen.dart  # User account creation form
│       └── home_screen/
│           ├── DiesaeseDetectionTap/# Tab folder containing Camera and Details screens
│           │   ├── CameraScreen.dart # Leaf scanner camera view with local model runs
│           │   ├── DeseaseDetectionContent.dart # Diagnosis gallery selection view
│           │   └── DetailsScreen.dart # Displays classified disease and confidence %
│           ├── DroneTap/            # UAV navigation and NDVI telemetry monitoring
│           ├── RobotTap/            # Robot status, UGV telemetry, and Rive Chatbot companion
│           ├── ProfileTap/          # User settings and sign out controls
│           └── HomeScreen.dart      # Main bottom navigation frame
├── firebase_options.dart            # Generated Firebase configuration
└── main.dart                        # Application entry point setting up Providers and Routing
```

---

## Setup and Installation

Follow these steps to run the Agrinova application on your local machine:

### 1. Prerequisites

Verify that the Flutter SDK is installed and configured correctly:
```bash
flutter doctor
```

### 2. Clone the Repository

Clone this repository and navigate into the project directory:
```bash
git clone https://github.com/nda-mohamed/AGRINOVA.git
cd AGRINOVA
```

### 3. Fetch Dependencies

Install all Flutter and Dart dependencies:
```bash
flutter pub get
```

### 4. Firebase Configuration

Agrinova uses Firebase services for authentication and database management:
1. Create a new project in the Firebase Console.
2. Enable Authentication (Email/Password and Google Provider) and Cloud Firestore.
3. Register your Android and iOS applications with the Firebase project.
4. Place the configuration files in their respective directories:
   - Android: Place `google-services.json` in `android/app/`.
   - iOS: Place `GoogleService-Info.plist` in `ios/Runner/`.
5. Run the FlutterFire configuration tool to generate `firebase_options.dart`:
   ```bash
   flutterfire configure
   ```

### 5. API Key Setup

Configure the API Key for the Chatbot service:
1. Open the file `lib/core/api/chatbot/chatbot_api_service.dart`.
2. Locate the static constant variable `apiKey`.
3. Provide your OpenRouter API key inside the double quotes.

### 6. Run the Application

Start the app on an active emulator or connected hardware device:
```bash
flutter run
```

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.
