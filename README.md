
# News App

A Flutter news app built with GetX and Clean Architecture. This app fetches and displays news stories from the Hacker News API, allowing users to view top stories, read comments, and search for specific stories by title.


## Features

- Top News Stories: Display a list of the top news stories with title, author, score, and number of comments.
- Story Details: View detailed information about a story, including the title, URL (if available), author, time, score, and comments.
- Comments: Display comments and nested comments for each story.


## Screenshots

<p float="left">
  <img src="https://github.com/Mezbah-byte/news_app/blob/main/screenshot/0.jpeg?raw=true" alt="App Screenshot 1" width="200" height="400">
  <img src="https://github.com/Mezbah-byte/news_app/blob/main/screenshot/2.jpeg?raw=true" alt="App Screenshot 2" width="200" height="400">
  <img src="https://github.com/Mezbah-byte/news_app/blob/main/screenshot/1.jpeg?raw=true" alt="App Screenshot 3" width="200" height="400">
</p>


## Architecture & Folder Structure

This project follows the Clean Architecture pattern, which divides the codebase into distinct layers to separate concerns and make the app scalable, maintainable, and testable. The folder structure is as follows:

lib/
|- core/ # Core utilities and common components
|- config/ # App configuration and constants
|- features/ # Feature-specific code
|- data/ # Data layer
|- models/ # Data models
|- repositories/ # Repositories and data sources
|- domain/ # Domain layer
|- entities/ # Business entities
|- usecases/ # Use cases or business logic
|- presentation/ # Presentation layer
|- pages/ # UI pages
|- controllers/ # GetX controllers
|- widgets/ # Reusable UI components
|- main.dart # App entry point



### Core Layer

The `core` layer contains utilities, shared components, and services that can be used across the application.

### Config Layer

The `config` layer holds configuration files and constants, such as API keys and environment settings.

### Features Layer

The `features` layer is organized by specific features of the application. Each feature contains its own `data`, `domain`, and `presentation` sublayers.

- **Data Layer**: Handles data fetching, mapping, and repository implementations.
- **Domain Layer**: Contains business entities and use cases. It defines the core business logic and rules.
- **Presentation Layer**: Includes UI components, pages, and controllers for managing state and presentation logic.


## Technologies & Dependencies

The project uses the following technologies and dependencies:

- **Flutter**: The framework used for building the cross-platform mobile application.
- **GetX**: A state management solution that also provides routing and dependency injection.
- **Dio**: A powerful HTTP client for Dart, used for making network requests.
- **Equatable**: Helps in making Dart objects comparable without implementing a lot of boilerplate code.
- **Dartz**: A functional programming library for Dart, providing tools like `Either` and `Option`.
- **connectivity_plus**: A plugin to check the network status of the device.
- **intl**: A library for internationalization and localization, used here mainly for date formatting.
- **http**: Another HTTP client for making network requests.
- **url_launcher**: A plugin to launch URLs in the default browser or apps.
- **lottie**: A library for rendering animations from Lottie files.

The dependencies are specified in the `pubspec.yaml` file and can be installed using Flutter's package manager.

## Installation & Usage

To run the application locally, follow these steps:

1. **Clone the Repository**  
   Clone the repository to your local machine using the following command:

   ```bash
   git clone https://github.com/Mezbah-byte/news_app.git
   cd news-app

2. **Install Dependencies**  
   Navigate to the project directory and run the following command to install the necessary dependencies:

   ```bash
   flutter pub get

3. **Run the Application**  
   You can start the application on an emulator or a physical device by running:

   ```bash
   flutter run

4. **Build for Production**  
   To build the app for production, you can use the following command:

   ```bash
   flutter build apk
