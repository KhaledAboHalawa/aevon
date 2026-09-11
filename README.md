# Aevon

<div align="center">

### AI-Powered Fitness Companion

A modern fitness application built with Flutter, combining personalized fitness experiences with an AI-powered assistant, workout discovery, and user-focused health tracking.

</div>

---

## 📱 Overview

**Aevon** is a fitness application designed to help users build healthier habits through personalized fitness content, workout recommendations, and an AI-powered fitness assistant.

The application provides a complete user journey — from onboarding and authentication to exploring workouts, managing a personal profile, and interacting with an AI assistant.

> **Note:** Aevon is a team project. The sections below highlight the features and engineering work I personally contributed to.

---

## ✨ Key Features

- 🤖 AI-powered fitness assistant
- ⚡ Real-time streaming AI responses
- 💬 Conversation history with Firebase Firestore
- 🗑️ Delete previous conversations
- 🎞️ Animated conversation history
- 🏋️ Workout discovery and exercise details
- 🖼️ Optimized image loading and caching
- 🔐 Login & registration
- 🧾 Multi-step registration flow
- 👤 Profile management
- ✏️ Edit profile information
- 🔑 Forgot password
- 🔒 Change password
- 🌍 Localization
- 📱 Responsive mobile UI

---

## 🤖 AI Fitness Assistant

One of the main features I worked on is Aevon's AI-powered fitness assistant.

Instead of waiting for the entire response before displaying it, the assistant processes the model output as a **stream** and progressively renders the response in the chat interface.

### Streaming Flow

```text
User Message
     │
     ▼
Firebase AI Logic
     │
     ▼
AI Response Stream
     │
     ├── Chunk 1 ──► Update Message
     ├── Chunk 2 ──► Update Message
     ├── Chunk 3 ──► Update Message
     └── ...
              │
              ▼
        Complete Response
````

This provides a more responsive chat experience and allows users to start reading the response while the model is still generating it.

The chat interface also handles:

* Streaming response updates
* Loading state before the first response
* Progressive message rendering
* Automatic scrolling to the latest content
* Starting a new conversation
* Conversation persistence

---

## 💬 Conversation History

AI conversations are persisted using **Firebase Firestore**, allowing users to return to previous conversations.

The history system supports:

* Saving conversations
* Loading previous conversations
* Sorting conversations by their latest update
* Opening an existing conversation
* Deleting conversations
* Starting a new conversation
* Animated insertion and removal

The conversation data is organized per authenticated user to keep each user's history isolated.

### History Architecture

```text
Chat UI
   │
   ▼
Chat Cubit
   │
   ▼
Chat Repository
   │
   ▼
Chat History Data Source
   │
   ▼
Firebase Firestore
```

For operations that involve processing larger collections of conversation data, sorting work can be moved away from the main UI thread to keep the interface responsive.

---

## 🏋️ Workout Experience

Aevon provides a dedicated workout experience where users can explore available workouts and exercises.

The workout section includes:

* Workout cards with imagery
* Exercise details
* Workout categories
* Recommended workouts
* Popular training content
* Dedicated exercise screens

The UI was designed around reusable components and horizontally scrollable content sections to keep the experience clean and easy to navigate.

---

## 🖼️ Image Performance Optimization

Fitness applications can display a large number of images, especially in workout and recommendation sections.

One performance consideration was controlling the **decoded image size** instead of unnecessarily decoding large source images at their original resolution.

By controlling image cache dimensions, the application can avoid allocating more memory than the rendered widget actually requires.

This is particularly useful for screens containing multiple workout cards and images.

---

## 🔐 Authentication & Account Management

I also worked on the authentication and account-management flow.

### Authentication

* Login
* Registration
* OTP verification
* Forgot password
* Create password
* Change password

### Registration Flow

Registration is divided into multiple steps to collect the user's fitness-related information.

The onboarding flow includes information such as:

* Gender
* Age
* Weight
* Height
* Fitness goal
* Activity level

This information can then be used to provide a more personalized fitness experience.

---

## 👤 Profile

Users can manage their personal fitness information through their profile.

Supported functionality includes:

* Viewing profile information
* Editing personal information
* Updating weight
* Updating fitness goals
* Updating activity level

---

## 🌍 Localization

The application supports localization to provide a more accessible experience for users across different languages.

Localization was integrated into the application architecture rather than being handled as isolated UI strings.

---

## 🏗️ Architecture

The project follows a **Clean Architecture** approach with a feature-oriented structure.

The main goal is to keep responsibilities separated and make individual features easier to maintain, test, and evolve.

### High-Level Structure

```text
lib/
│
├── core/
│   ├── ...
│
└── features/
    ├── auth/
    ├── chat/
    ├── workouts/
    ├── profile/
    └── ...
```

The application separates responsibilities across:

```text
Presentation
     │
     ▼
Domain
     │
     ▼
Data
```

This allows UI code to remain independent from infrastructure-specific implementations.

---

## 🧠 State Management

The application uses **BLoC/Cubit** for state management.

Cubits are responsible for coordinating UI state and feature logic while keeping widgets focused primarily on presentation.

For example, the AI chat flow separates:

```text
UI
 │
 ▼
Chat Cubit
 │
 ├── Loading State
 ├── Streaming State
 ├── Message Updates
 └── Error State
       │
       ▼
 Repository / Data Source
       │
       ▼
 Firebase AI Logic
```

This makes the streaming behavior easier to control without coupling the UI directly to the AI service.

---

## 🧩 Dependency Injection

Dependency injection is handled using:

* `GetIt`
* `Injectable`

This keeps feature dependencies explicit and avoids tightly coupling high-level components to concrete implementations.

It also makes infrastructure services such as Firebase-backed data sources easier to replace or manage independently.

---

## 🛠️ Tech Stack

| Technology             | Usage                             |
| ---------------------- | --------------------------------- |
| **Flutter**            | Cross-platform mobile application |
| **Dart**               | Application development           |
| **BLoC / Cubit**       | State management                  |
| **Firebase AI Logic**  | AI fitness assistant              |
| **Firebase Firestore** | Conversation persistence          |
| **Firebase**           | Backend services                  |
| **GetIt**              | Dependency injection              |
| **Injectable**         | Dependency registration           |
| **Clean Architecture** | Application architecture          |
| **Git**                | Version control                   |
| **Figma**              | UI/UX design                      |

---

## 👨‍💻 My Contribution

As part of the development team, I was responsible for several major areas of the application.

### AI & Chat

* Integrated the AI-powered fitness assistant
* Implemented streaming AI responses
* Managed progressive response rendering
* Implemented automatic chat scrolling
* Implemented new conversation flow
* Integrated conversation persistence
* Implemented previous conversation loading
* Implemented conversation deletion

### Workout Experience

* Implemented workout listing UI
* Implemented workout cards
* Implemented exercise-related screens
* Worked on workout image rendering and optimization

### Authentication

* Login
* Registration
* Multi-step registration
* OTP flow
* Forgot password
* Create password
* Change password

### Profile

* Profile screen
* Edit profile
* Weight editing
* Goal editing
* Activity-level editing

### Additional Work

* Localization
* Image caching optimization
* Firestore integration
* State management with Cubit
* Dependency injection integration
* UI behavior and performance improvements

---

## 🎯 Engineering Focus

While building Aevon, I focused not only on implementing screens but also on keeping the application responsive and maintainable.

Some of the engineering considerations included:

* Streaming data instead of waiting for complete responses
* Keeping UI state separate from data sources
* Persisting user-specific conversations
* Avoiding unnecessary image memory usage
* Moving heavier data-processing work away from the UI thread when appropriate
* Using dependency injection to reduce coupling
* Structuring features around Clean Architecture principles

---

## 🎨 Design

The application's UI/UX was designed in Figma and translated into Flutter components.

The design includes dedicated flows for:

* Onboarding
* Authentication
* Registration
* Home
* Workouts
* Exercises
* AI Chat
* Conversation History
* Profile
* Personal information editing

---

## 📸 Screenshots

> Screenshots can be added here from the project's final exported assets.

### Authentication

| Login            | Registration     |
| ---------------- | ---------------- |
| <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-56-52-541_com example aevon" src="https://github.com/user-attachments/assets/3f592cba-36cd-45ed-9627-f797800bb982" />   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-53-00-089_com example aevon-edit" src="https://github.com/user-attachments/assets/4ac24fea-9ad3-4415-a162-a4774ea20654" /> |
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-52-52-311_com example aevon" src="https://github.com/user-attachments/assets/02ca0836-35a0-4b41-935f-5a594a474f17" /> |
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-52-46-753_com example aevon" src="https://github.com/user-attachments/assets/e2f5c201-151b-428e-b001-9bb7a8014024" /> | 
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-52-40-893_com example aevon" src="https://github.com/user-attachments/assets/a52a3b21-933e-49a1-906b-dae63ec5bace" /> | 
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-52-29-156_com example aevon" src="https://github.com/user-attachments/assets/30e583b8-01c3-4fd5-adc5-feba280fec79" /> | 
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-52-19-872_com example aevon" src="https://github.com/user-attachments/assets/4574b92d-4081-4874-9c26-9e55a9c04381" /> | 
|                   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-01-18-16-601_com example aevon" src="https://github.com/user-attachments/assets/bea8bce2-5cf4-49d0-9521-c5dc3db88390" /> |



### AI Assistant

| Chat             | Conversation History |
| ---------------- | -------------------- |
| <img width="1080" height="2400" alt="Screenshot_2026-09-12-02-00-18-250_com example aevon" src="https://github.com/user-attachments/assets/cd666991-3321-40b2-81b1-800226768965" />   | <img width="1080" height="2400" alt="Screenshot_2026-09-12-02-07-30-882_com example aevon" src="https://github.com/user-attachments/assets/00da165c-996c-4bfc-8eff-ca214b067958" /> |
| <img width="1080" height="2400" alt="Screenshot_2026-09-12-02-00-58-316_com example aevon" src="https://github.com/user-attachments/assets/89c98e86-7ea2-409a-af7a-9616af5a94ad" />   |

---

## 🚀 Getting Started

### Prerequisites

Make sure you have:

* Flutter SDK
* Dart SDK
* Android Studio or Xcode
* A configured Firebase project

### Installation

Clone the repository:

```bash
git clone <repository-url>
```

Navigate to the project:

```bash
cd aevon
```

Install dependencies:

```bash
flutter pub get
```

Install dependencies:

```bash
fdart run build_runner build
```

Run the application:

```bash
flutter run
```

> Firebase configuration files and project-specific secrets are intentionally not included in the repository.

---

## 📂 Project Structure

A simplified view of the application structure:

```text
lib/
│
├── core/
│   ├── constants/
│   ├── di/
│   ├── localization/
│   ├── network/
│   └── ...
│
├── features/
│   │
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── chat/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── workouts/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── ...
│
└── main.dart
```

---

## 🤝 Team Project

Aevon was developed collaboratively as a team project.

Different parts of the application were implemented by different team members. This README intentionally separates my contributions from the overall application to accurately represent my role in the project.

---

## 📌 Project Status

Aevon is a portf
