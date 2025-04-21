# E-Commerce Flutter App

A modern e-commerce application built with Flutter that showcases a seamless shopping experience with various templates such as product detail pages, user profiles, login screens, and a shopping cart.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [App Structure](#app-structure)
  - [Widgets](#widgets)
    - [Product Info Container](#product-info-container)
    - [Cart Template](#cart-template)
    - [Home Template](#home-template)
    - [Login Template](#login-template)
    - [Product Template](#product-template)
    - [User Template](#user-template)
- [License](#license)

## Features

- Display products in a grid layout.
- Users can view product details and add them to their cart.
- Customizable app bar with options like log in, log out, and cart view.
- User profile management including editing and viewing personal details.
- Authentication flow for login and registration.
- Error handling and loading states.

## Installation

Follow these steps to install and set up the application on your local machine:

1. Clone the repository:
    ```bash
   git clone https://github.com/Maullin1996/fake_store_api_design.git
2. Navigate into the project directory:
    ```bash
    cd fake_store_api_design
3. Install the dependencies:
    ```bash
    flutter pub get
4. Run the application:
    ```bash
    flutter run

## Usage

Once the app is installed, you can use it on your Android or iOS emulator or on a physical device. The app offers a smooth user interface where users can browse products, view product details, and manage their cart.

- Login Flow: Users can log in using their credentials and access personalized features like their cart and favorites.

- Product Pages: Users can see product details including description, price, and add items to their cart.

- User Profile: Users can view and update their profile information.

## App Structure

This Flutter project is structured around several templates and components that make up the UI of the app. The main components include:

- ## Widgets

- ### Product Info Container
- Displays detailed information about a specific product, including its image, description, price, and a button to add it to the cart.
    ```bash
    class ProductInfoContainer extends StatelessWidget {
      final String url;
      final String productName;
      final String description;
      final String productPrice;
      final Function()? onPressedbuy;
      final bool isFavorite;
      final Function()? onPressedFavorite;
      // constructor and build method...
    }

- ### Cart Template
- Shows the user's shopping cart with a list of added products. It provides options to remove or add quantities to items in the cart, and displays the total amount to be paid.
    ```bash
    class CartTemplate extends StatelessWidget {
      final bool authentication;
      final List<dynamic> listCart;
      final String totalToPay;
      // constructor and build method...
    }

- ### Home Template
- The home screen of the app, where users can browse through different product categories, view a list of products, and add products to their favorites or cart.
    ```bash
    class HomeTamplate extends StatelessWidget {
      final bool isLogIn;
      final List<dynamic> products;
      final String? errorMessage;
      final bool isLoading;
      final List<dynamic> myFavoriteList;
      final List<dynamic> myCartList;
      final String selectedCategory;
      // constructor and build method...
    }

- ### Home Template
- Handles the user login flow, including text fields for username and password and a button to submit the credentials.
    ```bash
    class LoginTemplate extends StatelessWidget {
      final bool? isLoadingButton;
      final VoidCallback? cartonPressed;
      // constructor and build method...
    }

- ### Product Template
- Displays a product's detailed information in a separate screen, including its image, price, and description. The user can add the product to the cart or mark it as a favorite.
    ```bash
    class ProductTemplate extends StatelessWidget {
      final bool isFavorite;
      final VoidCallback? cartonPressed;
      final VoidCallback? backonPressed;
      // constructor and build method...
    }

- ### User Template
- Shows the user's profile information, such as their name, email, phone, and address. Users can log out, view their cart, or navigate back to the previous screen.
    ```bash
    class UserTemplate extends StatelessWidget {
      final VoidCallback? backonPressed;
      final VoidCallback? cartonPressed;
      final VoidCallback? logOutonPressed;
      final String lastName;
      final String name;
      final String username;
      // constructor and build method...
    }

## License
This project is licensed under the MIT License - see the LICENSE file for details.


