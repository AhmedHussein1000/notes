# Notes App

A simple offline Flutter application for creating, editing, and deleting notes using Hive as a local database. The app provides a smooth and minimal user experience without requiring any internet connection.

## Demo

[🎥 Watch App Demo Video](https://drive.google.com/file/d/1BogoWIubHpEnc7sKOSQWG2brHKZZsk4a/view?usp=drive_link)

> This video demonstrates the main features of the app — adding, editing, and deleting notes with a smooth offline experience.

## Features

- [x] Add new notes with a title and content.
- [x] Edit existing notes.
- [x] Delete notes.
- [x] Store data locally using Hive.
- [x] Fully offline functionality.
- [x] Clean and intuitive user interface.
- [x] State management using Cubit (flutter_bloc).

## Getting Started

To run this project locally:

```bash
git clone https://github.com/AhmedHussein1000/notes.git
cd notes
flutter pub get
flutter run

## Folder Structure

```bash
lib/
├── core/
│   ├── functions/       # Reusable helper functions
│   ├── helpers/         # Shared helper classes or utilities
│   ├── routes/          # App route management
│   ├── themes/          # App themes and styling
│   ├── utils/           # Constants and utilities
│   ├── widgets/         # Shared widgets used across the app
│
├── features/
│   └── notes/
│       ├── data/
│       │   └── models/          # Note model and related classes
│       └── presentation/
│           ├── controllers/
│           │   └── cubits/     # State management with Cubit
│           └── screens/
│               └── widgets/    # UI components related to notes
│
└── main.dart                   # App entry point
