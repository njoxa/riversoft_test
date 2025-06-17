# Live Matches Mobile App

This Flutter application displays a real-time, virtualized list of over 10,000 live matches. It is designed to be performant, interactive, and maintainable, showcasing best practices in Flutter development. The app features real-time odds updates, sport-based filtering, and persistent user selections.
The app targets android 7.0 sdk and can be ran on latest versions of android.
For design I took very small inspiration from Dribbble.com

## Key Features

- **Real-Time Data:** Displays 10,000+ live matches with odds that update in real-time.
- **Performant Scrolling:** Uses list virtualization to ensure smooth scrolling and minimal memory usage.
- **Interactive Betting Odds:** Users can select odds, which are highlighted and persisted.
- **Dynamic Highlights:** Odds changes are animated (green for increase, red for decrease) to provide clear visual feedback.
- **Persistent State:** User's odds selections are saved locally and restored on app restart.
- **Filterable Content:** Matches can be filtered by sport type from the header.

## Architecture

The application follows a clean, scalable architecture inspired by the BLoC pattern, with a strict separation of concerns.
I try to separate some services into separate packages, so it can be reused along projects.
/
├── lib/
│   ├── src/
│   │   ├── bloc/
│   │   │   ├── match_bloc/
│   │   │   │   ├── match_bloc.dart
│   │   │   │   ├── match_event.dart
│   │   │   │   └── match_state.dart
│   │   ├── data/
│   │   │   ├── data_sources/
│   │   │   │   ├── match_remote_data_source.dart
│   │   │   │   └── selection_local_data_source.dart
│   │   │   ├── models/
│   │   │   │   ├── match_model.dart
│   │   │   │   └── selection_model.dart
│   │   │   └── repositories/
│   │   │       └── match_repository.dart
│   │   ├── ui/
│   │   │   ├── screens/
│   │   │   │   └── match_list_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── match_list_item.dart
│   │   │   │   ├── odds_button.dart
│   │   │   │   └── sport_filter_bar.dart
│   │   │   └── app.dart
│   │   └── main.dart
│
├── packages/
│   ├── local_storage/
│   │   └── lib/
│   │       ├── src/
│   │       │   ├── local_storage_interface.dart
│   │       │   ├── hive_local_storage_impl.dart
│   │       │   └── shared_prefs_local_storage_impl.dart
│   │       └── local_storage.dart
│   ├── ui_kit/
│   │   └── lib/
│   │       ├── src/
│   │       │   ├── themes/
│   │       │   └── widgets/
│   │       └── ui_kit.dart
│   └── web_socket_client/
│       └── lib/
│           ├── src/
│           │   └── mock_web_socket_client.dart
│           └── web_socket_client.dart
│
├── test/
│   ├── bloc/
│   │   └── match_bloc_test.dart
│   └── widget/
│       └── match_list_screen_test.dart
│
└── pubspec.yaml



- **`main.dart`**: Entry point of the application.
- **`lib/src//data`**: The data layer, responsible for sourcing data from remote (mock WebSocket) and local (device storage) sources.
  - **`data_sources`**: Abstracted classes for fetching data.
  - **`models`**: Plain Dart objects representing the data structures.
  - **`repositories`**: Consolidates data from different data sources and provides it to the BLoC.
- **`lib/src//bloc`**: The business logic layer. It responds to UI events, manages state, and communicates with the data layer.
- **`lib/src//ui`**: The presentation layer, containing all widgets and screens. It is responsible for rendering the UI based on the BLoC's state and dispatching user events.
- **`packages/`**: Local, reusable packages that are decoupled from the main application's business logic.
  - **`local_storage`**: An abstraction for device storage, with implementations for both Hive and SharedPreferences.
  - **`ui_kit`**: Contains reusable UI elements, themes, colors, and styles.
  - **`web_socket_client`**: A mock WebSocket client to simulate real-time data streams.

## Key Decisions

### State Management: BLoC

The BLoC (Business Logic Component) pattern was chosen for several key reasons:
Spera

1.  **Separation of Concerns**: Bloc decouples UI from business logic.
2.  **Testability**: Isolation from UI makes bloc easy to test.
3.  **Reactive State Management**: State changes are reactive meaning it can handle streams of data in different ways and make it appear instantly.
4.  **Performance**: BLoCs work efficiently with streams, making them a natural fit for handling real-time data from the WebSocket. The `flutter_bloc` library provides widgets like `BlocBuilder` that intelligently rebuild only the necessary parts of the UI.

I utilized methods such as context.select for only listening to necessary parameter changes in widgets such as OddsButton. where only the odd is updated. this types of optimization can help the application in long term especially with frequent data updates

### Performance Optimization: List Virtualization

To render a list of 10,000+ items without performance degradation, we should use `ListView.builder`. I avoided external packages because it bloats the app for no reason. If we need extra performance we can use slivers instead of regular listview builders. It only builds and renders the list items that are currently visible on the screen, plus a small cache area. As the user scrolls, items that move off-screen are recycled and reused (also using key property), keeping memory consumption low and ensuring a smooth adaptive FPS (min. 60 fps) scroll experience.

### Local Storage: Abstracted Implementation

I created a separate package for local storage for easy reuse in projects and also version management if needed. With abstraction I have implemented both hive and shared_preferences packages which can be easily switched during development.

### Web socket client: Abstracted implementation

I created a separate package for the client as well. keeps the main codebase clean and not bloated while clearly seeing its purpose. I'm currently using a mock client with faker package which generates testing info for the application mock data.

### Data classes: Freezed

For data classes I used freezed which can act as a data class for our mock data and real data as well in future. build_runner is undergoing serious changes so we can expect amazing speed bumps in development times, while also utilizing the benefits of freezed such as autogenerated json serialization methods and data class functions.

## UI_KIT: Design

For designs I typically separate the ui from the core codebase so we can reuse the ui_kit along projects and also have brand specific ui designs.

## How to Run the App

1.  **Clone the Repository**

    ```bash
    git clone <your-repo-url>
    cd <your-repo-name>
    ```

2.  **Get Dependencies**

    Make sure you have Flutter SDK installed. Run the following command in the root directory of the project to fetch all the dependencies for the main app and the local packages:

    ```bash
    flutter pub get
    ```

3.  **Run the App**

    Connect a device or start an emulator and run the following command:

    ```bash
    flutter run
    ```

4.  **Run Tests**

    To run the unit and widget tests, use the following command:

    ```bash
    flutter test
    ```
