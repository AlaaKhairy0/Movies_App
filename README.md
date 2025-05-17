# 🎬 Movies App

**Movie Discovery App** built with Flutter.

A cross-platform mobile application that allows users to discover and stream movies.

---

## ✨ Features

- 🔍 Search and discover trending movies
- 🎥 View movie details with posters, genres, ratings, and descriptions
- ❤️ Save favorite films and manage user preferences
- 🔥 Firebase integration for storing user data
- 🌐 Integrated with external movie databases via APIs

---

## 🏗 Architecture

- **Clean Architecture** with feature-based modular structure
- **MVVM Pattern** for separation of concerns
- **BLoC** for reactive and maintainable state management

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or above recommended)
- Firebase project (with `firebase_options.dart` generated)
- Internet connection for API access

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AlaaKhairy0/Movies_App.git
   cd movies_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## 🔥 Firebase Setup

This project includes `firebase_options.dart`. To regenerate it or link to your Firebase project, use:

```bash
flutterfire configure
```


---

## 🌐 API Integration

This app uses the [TMDb (The Movie Database) API](https://developers.themoviedb.org/3/getting-started/introduction)  
to fetch movie data including titles, overviews, posters, genres, ratings, and more.


---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_screenutil: ^5.9.3
  google_fonts: ^6.2.1
  carousel_slider: ^5.0.0
  http: ^1.2.2
  firebase_core: ^3.8.1
  cloud_firestore: ^5.5.1
  flutter_bloc: ^8.1.6
```

---

## 📽 Demo Video

Watch the demo video of the app:  
👉 [The Demo](https://drive.google.com/file/d/1J_AofFClqZUP76huOM9M-PQMgoWggoqu/view?usp=sharing)

---

## 🧑‍💻 Authors

**Alaa Khairy** • [@AlaaKhairy0](https://github.com/AlaaKhairy0)  
**Mohamed Abdallh** • [@bleo11](https://github.com/bleo11)


