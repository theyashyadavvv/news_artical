# 📰 News Buzz – Flutter News Application

**News Buzz** is a minimal, modern Flutter application that delivers the latest news from across the web in a clean and readable format. Designed with simplicity and user experience in mind, it features category-based browsing, in-app article viewing, bookmarking, and support for black/white themes.


---

## ✨ Key Features

### 🔐 Authentication
- Simple login screen with email/password fields
- Validation and navigation to the main app on login

### 🗞️ News Feed
- Fetches top headlines using the NewsAPI
- Each article shows:
  - Title
  - Thumbnail image
  - Source name
  - Description snippet
  - Published date
- Tapping an article opens it in an embedded WebView

### 🔖 Bookmarks
- Save your favorite articles for later
- Accessible via a dedicated "Bookmarks" tab
- Stored locally using shared preferences

### 🎨 Themes
- Toggle between:
  - **Clean White Theme**
  - **High-contrast Black Theme**
- Seamless switch via in-app toggle

### 🔄 Extras
- Pull to refresh the news feed
- Search bar to filter articles by keyword
- Fully responsive and mobile-friendly UI

---

## 🛠️ Tech Stack

- **Flutter** 3.29.0 (Stable)
- `http` – API calls
- `flutter_bloc` – State management (Cubit)
- `webview_flutter` – Article viewer
- `shared_preferences` – Bookmark storage
- `google_fonts`, `intl`, `cached_network_image` – UI enhancements

---

## 🚀 Getting Started

### 🔧 Prerequisites
- Flutter SDK
- Android Studio or VS Code
- NewsAPI key (optional: default demo key is included for testing)

### 📦 Installation



```bash
git clone https://github.com/theyashyadavvv/news_application.git
cd news_application
flutter pub get
flutter run

---

## Screenshots 📸
![1](https://github.com/user-attachments/assets/716de6e6-1e75-4a7c-8f55-6fa540a87735)
![3](https://github.com/user-attachments/assets/e897080a-bc99-40ba-8eee-8c8149e3defa)
![2](https://github.com/user-attachments/assets/cc0f138b-5a07-4a9b-9f7c-c5b95b0c5815)
![4](https://github.com/user-attachments/assets/0aecdf6a-770d-411b-8a7e-3ef37a461069)



---


# 📬 Final Note

Thank you for reviewing ![Uploading login.jpg…]()
**News Buzz**! This app was built with attention to detail, clean architecture, and a focus on user experience. If you have any questions, suggestions, or feedback, feel free to reach out or open an issue.

> This project reflects my passion for Flutter development and my commitment to writing maintainable, scalable code. Looking forward to the opportunity to contribute and grow as part of the AiBuzz team!
