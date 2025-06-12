# Food Filter App

A beautiful Flutter application that allows users to filter food items by dietary preferences using Chip and Wrap widgets.

## Features

- **Dietary Preference Filtering**: Select from various dietary options (Vegetarian, Vegan, Gluten-Free, etc.)
- **Interactive UI**: 
  - FilterChip for available dietary options
  - Chip with delete functionality for selected filters
  - Real-time filtering of food items

## Technologies Used

- **Flutter** - Framework for building cross-platform apps
- **Dart** - Programming language
- **Google Fonts** - For Poppins font family
- **Material Design** - For UI components

## Installation

1. Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install)
2. Clone this repository:
   ```bash
   git clone https://github.com/Ninette03/food_menu.git
    cd food-filter-app
    flutter pub get
    flutter run

This app demonstrates the use of several Flutter widgets:

Widget	    Purpose	                        Key Features Demonstrated
Wrap	    Layout for filter chips	        spacing, runSpacing, alignment
Chip	    Selected filters display	    label, backgroundColor, onDeleted
FilterChip	Available filters	            label, selectedColor, onSelected
