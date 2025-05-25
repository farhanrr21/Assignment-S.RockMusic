# S.Rock Music App

**by Farhan Ryan Rafli**

## Overview

This is an Assignment Brief Challenge by S.Rock Music Company

## Architecture

- **MVVM** (Model-View-ViewModel)
  - **HomeScreen**: Displays the main page with a search bar, hero section, and cards for various services.
  - **Card Detail Screen**: Displays the details of a service when a card is tapped.
  - **HomeViewModel**: Handles the app's logic, fetching data from Firebase Firestore.
  - **Model**: Defines the data structure for the services.
  - **Repository**: Fetches the data from Firebase Firestore and passes it to the `HomeViewModel`.

## Approach

My approach started by **slicing the UI components** that were **unrelated** to Firebase. This allowed me to focus on the layout and design of the home screen and card components. Afterward, I shifted focus to integrating **Firebase Firestore**, where I fetched the service data, which I then displayed on the cards.

## Features

- **MVVM Architecture**: Clean separation between UI, data, and logic.
- **Firebase Firestore Integration**: Data for services is fetched in real-time from Firebase.
- **Tappable Cards**: Each service card navigates to a detailed view showing the tapped service.
- **Responsive UI**: The app adapts to various screen sizes and orientations.

P.S.: Kinda having fun with this one because i learn a lot for implementing the MVVM and Provider, Thanks S.Rock for this Challenge 🙏
