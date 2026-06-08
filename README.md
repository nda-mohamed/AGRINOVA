# 🌿 Agrinova

An AI-powered **Smart Agriculture Companion** application built with **Flutter**. Developed as a graduation project, Agrinova integrates **on-device Machine Learning** for plant disease classification, a **voice-activated conversational chatbot** with animated Rive avatars, drone/robot hardware controllers, and a secure **Firebase** cloud backend.

---

## ✨ Features

- **📸 AI Plant Disease Diagnosis**:
  - **On-Device Inference (Offline)**: Classify plant diseases instantly using a custom-trained TensorFlow Lite CNN model (`plant_disease_model_cnn.tflite`) via `tflite_flutter`.
  - **API-Based Classifier**: Connects to a remote disease prediction API (`http://127.0.0.1:8000`) for high-precision model execution.
  - **Image Sourcing**: Take photos via the device camera or upload from the gallery using `image_picker`.
- **🤖 Animated Voice Chatbot Companion**:
  - **Smart Chatbot Service**: Conversational interface linked to an AI server (`http://10.0.2.2:8000/ask`) secured with specialized API token headers.
  - **Speech-to-Text (STT) & Text-to-Speech (TTS)**: Fully voice-operated interaction using `speech_to_text` and `flutter_tts`.
  - **Rive Vector Animations**: Rich, fluid interactive companion avatar behaviors powered by the `rive` animation engine.
- **🛰️ Drone & Hardware Dashboards**: Integrated control hubs (`DroneTap` & `RobotTap`) representing telemetry data and monitoring feeds for automated field robots and agricultural drones.
- **🔐 Firebase Cloud Architecture**:
  - Secure authentication (Email/Password registration and **Google Sign-In**) via **Firebase Auth**.
  - User profiles and sensor logs synced to **Cloud Firestore**.
- **🛹 Agriculture Onboarding**: Engaging tutorial walkthroughs (`onBoardingScreen`) detailing the app's AI utilities.

---

## 🛠️ Tech Stack & Dependencies

Agrinova leverages several state-of-the-art packages:

- **Machine Learning & Image Utilities**:
  - `tflite_flutter` — On-device TensorFlow Lite model interpreter.
  - `image` — Image decoding, resizing, and normalizing helper.
  - `image_picker` — Camera and gallery utilities.
- **State Management**: [provider](https://pub.dev/packages/provider) — Manages chat state (`ChatProvider`) and UI themes.
- **AI Conversation & Voice**:
  - `speech_to_text` — Translates user speech into chat prompts.
  - `flutter_tts` — Speaks AI responses aloud.
- **Vector Animations**: [rive](https://pub.dev/packages/rive) — High-performance vector animation graphics for the companion robot.
- **Cloud Backend**:
  - `firebase_core` & `cloud_firestore` — Cloud database syncing.
  - `firebase_auth` & `google_sign_in` — User credentials management.
- **Configuration & Networking**:
  - `flutter_dotenv` — Dynamic environment variable configurations.
  - `http` — REST API calls to classification and chatbot backends.

---

## 📁 Project Directory Structure

```text
lib/
├── FirebaseServices/            # Firebase auth & database sync classes
├── core/
│   ├── ai/
│   │   └── plant_disease_model.dart # On-device TFLite interpreter and image resizer
│   ├── api/
│   │   ├── chatbot/
│   │   │   ├── chat_controller.dart # Handles chat logic and TTS trigger
│   │   │   ├── chat_message.dart    # Chat bubble data model
│   │   │   ├── chat_provider.dart   # Chat state notifier provider
│   │   │   └── chatbot_api_service.dart # AI query client sending prompts to local FastAPI
│   │   └── disease_detection/
│   │       └── disease_api_service.dart # Multi-part API client for remote image uploads
│   ├── app_theme/
│   │   └── AppTheme.dart        # Main UI color definitions and ThemeData settings
│   ├── repository/              # Data repository mapping
│   ├── routes/
│   │   └── AppRoutes.dart       # Enums organizing paths (AppRoute)
│   └── widgets/                 # Reusable layout buttons and cards
├── Ui/
│   └── screens/
│       ├── auth_screen/         # Portal screen routing users to login or register
│       ├── onboarding_screen/   # Multi-slide introduction tutorial carousel
│       ├── login_screen/        # Secure credentials entry page
│       ├── register_screen/     # Account register details form page
│       └── home_screen/
│           ├── DiesaeseDetectionTap/ # Camera/gallery ML disease diagnostic tab
│           ├── DroneTap/        # Remote drone dashboard telemetry monitor
│           ├── RobotTap/        # Chatbot view containing interactive Rive avatar
│           ├── ProfileTap/      # User settings and sign out controls
│           └── HomeScreen.dart  # Main frame screen containing bottom navigation tabs
├── firebase_options.dart        # Platform-specific Firebase settings file
└── main.dart                    # App launcher declaring Firebase & MultiProviders
```

---

## 🚀 Getting Started

Follow these instructions to run Agrinova on your environment:

### 1. Prerequisites

Verify that the [Flutter SDK](https://docs.flutter.dev/get-started/install) is installed and updated on your system.

```bash
flutter --version
```

### 2. Clone the Repository

```bash
git clone https://github.com/nda-mohamed/AGRINOVA.git
cd AGRINOVA
```

### 3. Fetch Dependencies

Install the pub packages:

```bash
flutter pub get
```

### 4. Firebase Configuration

Agrinova connects to Firebase for user auth and data storage.
1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Setup clients for Android/iOS or use FlutterFire CLI (`flutterfire configure`).
3. Place `google-services.json` inside `android/app/` and `GoogleService-Info.plist` inside `ios/Runner/`.

### 5. Local Services Setup (Chatbot & Remote ML)

The app accesses backend servers running locally (`127.0.0.1` / `10.0.2.2`):
- Start your FastAPI chatbot backend on port `8000` to handle prompts on `/ask?prompt=...` using the API Key: `agrinova-key-7f3a9b2c1d4e5f6a`.
- Run your disease prediction model server on port `8000` (or update target IPs inside `lib/core/api/`).

### 6. Run the Project

Deploy to an emulator or connected testing device:

```bash
flutter run
```
