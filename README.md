# e_commerce_app

# Cyber Linio - eCommerce App

A Flutter-based eCommerce application showcasing products from FakeStoreAPI with features like product browsing, favorites management, and cart functionality.


## Features

- **Product List**: View a list of products with images, names, and prices
- **Product Details**: Detailed view with large image, description, and pricing
- **Favorites**: Add/remove products to favorites with persistent local storage
- **Shopping Cart**: Add products to cart with quantity management
- **Responsive UI**: Clean and responsive interface inspired by Figma design
- **State Management**: BLoC pattern for product state and Cubit for favorites/cart
- **Pull-to-Refresh**: Refresh product list on the home screen
- **Error Handling**: Proper loading and error states for API calls

## Tech Stack

- **Flutter**: 3.19.5
- **State Management**: BLoC + Cubit
- **Local Storage**: SharedPreferences
- **API**: FakeStoreAPI (https://fakestoreapi.com)
- **Dependency Injection**: Built-in Flutter 

## Architecture

The app follows a layered architecture:

lib/
├── onBoarding
│   ├── pages/
│   │   ├── home_page.dart      
│   │   ├── cart_page.dart       
│   │   └── favorites_page.dart 
│   │   └── profile_page.dart   
│   └── widgets/
│       ├── product_details.dart  
