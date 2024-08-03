
# News App

A Flutter news app built with GetX and Clean Architecture. This app fetches and displays news stories from the Hacker News API, allowing users to view top stories, read comments, and search for specific stories by title.


## Features

- Top News Stories: Display a list of the top news stories with title, author, score, and number of comments.
- Story Details: View detailed information about a story, including the title, URL (if available), author, time, score, and comments.
- Comments: Display comments and nested comments for each story.


## Screenshots

![App Screenshot](https://github.com/Mezbah-byte/news_app/blob/main/screenshot/0.jpeg?raw=true)
![App Screenshot](https://github.com/Mezbah-byte/news_app/blob/main/screenshot/2.jpeg?raw=true)
![App Screenshot](https://github.com/Mezbah-byte/news_app/blob/main/screenshot/1.jpeg?raw=true)

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
