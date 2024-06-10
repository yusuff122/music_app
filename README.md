# music_app

A new Flutter project.

## Getting Started

Follow these instructions to build and run the project

## Setup Flutter
A detailed guide for multiple platforms setup could be find [here](https://docs.flutter.dev/get-started/install)

* Clone this repository using  ``` git clone https://github.com/yusuff122/music_app```

* ```cd``` into ```music__app```

* ```flutter pub get``` to get all the dependencies.

* Running the app ```flutter run```

## Screenshots

<img width="341"  height="690" alt="Ekran Resmi 2024-06-10 14 35 15" src="https://github.com/yusuff122/music_app/assets/99033192/7e5696d3-9325-4ad9-8312-50326234808a">

<img width="341" height="690" alt="x" src="https://github.com/yusuff122/odev-mainn/assets/99033192/a99c0bd5-5eec-4a83-8f85-004686aa15f6">

<img width="341" height="690" alt="Ekran Resmi 2024-06-10 14 56 13" src="https://github.com/yusuff122/odev-mainn/assets/99033192/c2ff01bc-02a3-4af5-98f5-75398de4a7ed">

<img width="341" height="690" alt="Ekran Resmi 2024-06-10 14 55 02" src="https://github.com/yusuff122/odev-mainn/assets/99033192/32b00fac-4340-47c1-bb92-751c244277bf">


## Project Structure


```

music_app/lib/
├── consts/
|    ├── textStyles.dart                   # Used to edit font styles
├── controller/                          
│   ├── music_player_controller.dart       # controls music playback status
│   └── playerState.dart                   # Controls transitioning from selected music to another.
|   ├── progess_bar_controlller.dart       # Provides progress bar control
├── pages/
│   └── artist_song_page.dart              # Songs of artists are exhibited
|   ├── home_page.dart                     # Home page
|   ├── like_page.dart                     # Showing liked songs
|   ├── my_home_page.dart                  # Controls transitions to other pages with bottom_bar
|   ├── player_page.dart                   # Played music is displayed
|   ├── search_page.dart                   # music search page
├── state_management/                         
│   └── get_music_provider.dart            # retrieves data from local storage and distributes it via provider package
|   ├── theme_provider.dart                # Manages application theme
|   ├── theme.dart                         # colors become clear
├── widgets/                      
│   ├── artist_list_widget.dart            # artists are exhibited                      
│   ├── bottom_sheet_widget.dart           # sleep timer interface
│   └── favorites_widget.dart              # showcases popular music
|   ├── file_share.dart                    # shares files
|   ├── music_card.dart                    
|   ├── music_list_card.dart
|   ├── player_icons_widget.dart
|   ├── player_slider_and_icon_widget.dart
|   ├── player_text_widget.dart
|   ├── theme_button.dart
├── main.dart
```

## packages used
*  cupertino_icons:  Provides iOS-style icons.

*  google_fonts:  Enables the use of Google Fonts.

*  provider:  Facilitates state management.

*  sizer: Enables responsiveness and dynamic font sizing.

*  salomon_bottom_bar: Offers a sleek and simple bottom navigation bar.

*  marquee: Scrolls text horizontally to display overflowing text.

*  card_swiper: Allows for swiping through cards.

*  dynamic_height_grid_view: Provides a grid view with dynamic heights.

*  audio_video_progress_bar: Displays a progress bar for audio and video players.

*  dropdown_button2: Advanced dropdown buttons with extra features.

*  image_picker: Allows for picking images from the gallery or camera.

*  path_provider: Provides access to the device's file system paths.

*  permission_handler: Simplifies managing permissions.

*  on_audio_query: Queries audio files stored on the device.

*  shared_preferences: Stores small amounts of data persistently.

*  just_audio: High-performance audio playback.

*  searchbar_animation: Adds animation to the search bar.

*  bottom_sheet: Offers animated bottom sheets.

*  share_plus: Adds functionality for sharing content.

*  flutter_staggered_grid_view: Provides a staggered grid view.

*  mesh_gradient: Creates mesh gradients transitioning between two colors.

* just_audio_background: Background component for playing audio in the background using the Just Audio package.
