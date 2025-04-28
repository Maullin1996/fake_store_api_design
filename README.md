# E-Commerce Flutter App

A modern e-commerce application built with Flutter that showcases a seamless shopping experience with various templates such as product detail pages, user profiles, login screens, and a shopping cart.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [App Structure](#app-structure)
  - [Widgets](#widgets)
    - [Product Info Container](#product-info-container)
    - [Product Cart Container](#product-cart-container)
    - [Product Home Container](#product-home-container)
    - [Custom Dialog](#custom-dialog)
    - [Custom Appbars](#custom-appbars)
    - [List Category](#list-category)
    - [Is Favorite](#is-favorite)
    - [Cart Template](#cart-template)
    - [Home Template](#home-template)
    - [Login Template](#login-template)
    - [Product Template](#product-template)
    - [User Template](#user-template)
    - [Custom Floating Notifications](#custom-floating-notifications)
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
      // The URL of the product image.
      final String url;
      // The name of the product.
      final String productName;
      // A detailed description of the product.
      final String description;
      // The price of the product.
      final String productPrice;
      // The callback function for the "Add to cart" button.
      final Function()? onPressedbuy;
      // Whether the product is marked as a favorite.
      final bool isFavorite;
      // The callback function for the favorite button.
      final Function()? onPressedFavorite;
      // constructor and build method...
    }
<p align = "center">
  <img src="assets/images/product_info.png" alt="alt text" width="250" />
</p>

- ### Product Cart Container
- Displays detailed information about the product that you want to buy, including its image, price, quantity, and a two buttons to increase or decrease the quantity of the productyou want to buy.
    ```bash
    class ProductCartContainer extends StatelessWidget {
      // The URL of the product image.
      final String url;
      // The name of the product.
      final String productName;
      // The current amount quantity of the product in the cart.
      final String amount;
      // The price of the product.
      final String productPrice;
      // The callback function to handle the increase action for the product quantity.
      final Function()? onPressedplus;
      // The callback function to handle the decrease action for the product quantity.
      final Function()? onPressedminus;
      // constructor and build method...
    }
<p align = "center">
  <img src="assets/images/product_cart.png" alt="alt text" width="300" />
</p>

- ### Product Home Container
- Displays a product's image, name, category, price, and buttons for
buying the product, viewing more information, and adding it to favorites.
    ```bash
    class ProducthomeContainer extends StatelessWidget {
      // The URL of the product image.
      final String url;
      // The name of the product.
      final String productName;
      // The category to which the product belongs.
      final String productCategory;
      // The price of the product.
      final String productPrice;
      // The callback function for the buy button.
      final Function()? onPressedbuy;
      // The callback function for the information button.
      final Function()? onPressedinfo;
      // The callback function for the favorite button.
      final Function()? onPressedFavorite;
      // Whether the product is marked as a favorite.
      final bool isFavorite;
      // constructor and build method...
    }

<p align = "center">
  <img src="assets/images/product_home.png" alt="alt text" width="200" />
</p>

- ### Custom Dialog
- Displays a dialog with different content and actions depending on whether the user is authenticated or unauthenticated.
    ```bash
    enum DialogType {authenticated,unauthenticated}
    class CustomDialog extends StatelessWidget {
      // Type of dialog authenticated or unauthenticated.
      final DialogType dialogType;
      // Callback for when the dialog button is pressed.
      final VoidCallback? onDialogButtonPressed; 
      // Total amount to be paid.
      final String totalToPay;
      // constructor and build method...
    }
<p align = "center">
  <img src="assets/images/autehntucated_dialog.png" alt="alt text" width="250" />
</p>
<p align = "center">
  <img src="assets/images/unautehntucated_dialog.png" alt="alt text" width="250" />
</p>

- ### Custom Appbars
- Display a appbar that the user can customized with headers and customizable functions
    ```bash
    class CustomAppbars extends StatelessWidget implements PreferredSizeWidget {
        // The type of the AppBar (product, cart, etc.)
        final AppbarType appbarType; 
        // The user first name (optional)
        final String? name; 
        // The user last name (optional)
        final String? lastName; 
        // Action to perform when the back button is pressed
        final Function()? backonPressed; 
        // Action to perform when the cart button is pressed
        final Function()? cartonPressed;
        // Action to perform when the login button is pressed 
        final Function()? logInonPressed; 
        // Action to perform when the logout button is pressed
        final Function()? logOutonPressed;
        // Action to perform when the user profile button is pressed 
        final Function()? useronPressed; 
      // constructor and build method...
  }
  
<p align = "center">
  <img src="assets/images/custom_appbar.png" alt="alt text" width="350" />
</p>
<p align = "center">
  <img src="assets/images/custom_appbar1.png" alt="alt text" width="350" />
</p>

- ### List Category
- Displays a list of predefined categories as horizontally scrollable buttons.
The selected category button is styled differently to indicate the current selection.
    ```bash
    class ListCategory extends StatelessWidget {
      // The category currently selected by the user.
      final String selectedCategory; 
      // Callback triggered when a category is selected.
      final ValueChanged<String> onCategorySelected; 
    // constructor and build method...
  }
<p align = "center">
  <img src="assets/images/list_category.png" alt="alt text" width="450" />
</p>

- ### Custom Floating Notifications
- provides a method to display a floating toast message with different content, background, and text colors based on the product verification status (added, not added, or error).
    ```bash
    enum TypeVerification {
      // The product was added successfully.
      added,
      // The product was already added.
      notAdded, 
      // A custom error message.
      errorMessage, 
    }
    class CustomFloatingNotifications {
      // Optional error message to be used when TypeVerification.errorMessage is triggered.
      final String? errorMessage;
    // constructor and build method...
      // A method to trigger the toast notification based on the verification status.
      //
      // The toast message, background color, and text color are determined by the type of verification.
      void customNotification(TypeVerification type) {
        _showToast(type);
    }
  }

<p align = "center">
  <img src="assets/images/custom_floating.png" alt="alt text" width="100" />
</p>
<p align = "center">
  <img src="assets/images/custom_floating1.png" alt="alt text" width="130" />
</p>

- ### Is Favorite
- shows a product name in a `Text` widget and an icon button that allows the user to mark the product as a favorite.
    ```bash
    class IsFavorite extends StatelessWidget {
      // The name of the product.
      final String productName;
      // The style applied to the product name text. 
      final TextStyle textStyle;
      // Whether the product is a favorite or not.
      final bool isFavorite;
      // The callback function triggered when the favorite button is pressed.
      final Function()? onPressedFavorite; 
  // constructor and build method...
  }
<p align = "center">
  <img src="assets/images/is_favorite.png" alt="alt text" width="250" />
</p>

- ### Cart Template
- Shows the user's shopping cart with a list of added products. It provides options to remove or add quantities to items in the cart, and displays the total amount to be paid.
    ```bash
    class CartTemplate extends StatelessWidget {
      class CartTemplate extends StatelessWidget {
        // The authentication state of the user.
        final bool authentication;
        // The first name of the user (if authenticated).
        final String? name;
        // The last name of the user (if authenticated).
        final String? lastName;
        // The total price to pay for the items in the cart.
        final String totalToPay;
        // The list of products in the cart.
        final List<dynamic> listCart;
        // The callback function for the "back" button.
        final VoidCallback? backonPressed;
        // The callback function for logging out.
        final VoidCallback? logOutonPressed;
        // The callback function for logging in.
        final VoidCallback? logInonPressed;
        // The callback function for decreasing the quantity of a product in the cart.
        final void Function(dynamic)? onPressedminus;
        // The callback function for increasing the quantity of a product in the cart.
        final void Function(dynamic)? onPressedplus;
        // The callback function for when the dialog button is pressed.
        final VoidCallback? onDialogButtonPressed;
      // constructor and build method...
    }
<p align = "center">
  <img src="assets/images/cart_template.png" alt="alt text" width="250" />
</p>

- ### Home Template
- The home screen of the app, where users can browse through different product categories, view a list of products, and add products to their favorites or cart.
    ```bash
    class HomeTamplate extends StatelessWidget {
      // A flag indicating whether the user is logged in.
      final bool isLogIn;
      // A list of products to be displayed on the home screen.
      final List<dynamic> products;
      // An optional error message to be displayed in case of an error.
      final String? errorMessage;
      // A flag indicating whether the products are currently loading.
      final bool isLoading;
      // A list of the user favorite products.
      final List<dynamic> myFavoriteList;
      // A list of the products in the user shopping cart.
      final List<dynamic> myCartList;
      // The selected category to filter the displayed products.
      final String selectedCategory;
      // The callback function to handle favorite button presses on products.
      final void Function(dynamic)? onPressedFavorite;
      // The callback function to handle info button presses on products.
      final void Function(dynamic)? onPressedinfo;
      // The callback function to handle buy button presses on products.
      final void Function(dynamic)? onPressedbuy;
      // The callback function to handle the log in action.
      final VoidCallback? logInonPressed;
      // The callback function to handle the cart button press.
      final VoidCallback? cartonPressed;
      // The callback function to handle user profile button press.
      final VoidCallback? useronPressed;
      // The callback function to handle log out action.
      final VoidCallback? logOutonPressed;
      // The first name of the user (if logged in).
      final String? name;
      // The last name of the user (if logged in).
      final String? lastName;
      // The callback function to handle category selection.
      final void Function(String) onCategorySelected;
      // constructor and build method...
    }

<p align = "center">
  <img src="assets/images/home_template.png" alt="alt text" width="250" />
</p>

- ### Login Template
- Handles the user login flow, including text fields for username and password and a button to submit the credentials.
    ```bash
    class LoginTemplate extends StatelessWidget {
      // A flag indicating whether the login button is in a loading state.
      final bool? isLoadingButton;
      // The callback function for when the cart button is pressed.
      final VoidCallback? cartonPressed;
      // The callback function for when the back button is pressed.
      final VoidCallback? backonPressed;
      // The callback function for when the login button is pressed.
      final VoidCallback? onPressed;
      // The callback function to handle changes to the password field.
      final Function(String)? onChangePassword;
      // The callback function to handle changes to the username field.
      final Function(String)? onChangeUsername;
      // A controller for the username input field.
      final TextEditingController? usernameController;
      // A controller for the password input field.
      final TextEditingController? passwordController;
      // A validator function for the password field.
      final String? Function(String?)? validatorPassword;
      // A validator function for the username field.
      final String? Function(String?)? validatorUsername;
      // constructor and build method...
    }

<p align = "center">
  <img src="assets/images/login_template.png" alt="alt text" width="250" />
</p>

- ### Product Template
- Displays a product's detailed information in a separate screen, including its image, price, and description. The user can add the product to the cart or mark it as a favorite.
    ```bash
    class ProductTemplate extends StatelessWidget {
      // A flag indicating whether the product is marked as a favorite.
      final bool isFavorite;
      // The callback function for when the cart button is pressed.
      final VoidCallback? cartonPressed;
      // The callback function for when the back button is pressed.
      final VoidCallback? backonPressed;
      // The callback function for when the favorite button is pressed.
      final VoidCallback? onPressedFavorite;
      // The callback function for when the buy button is pressed.
      final VoidCallback? onPressedbuy;
      // The URL of the product image.
      final String url;
      // A description of the product.
      final String description;
      // The name of the product.
      final String productName;
      // The price of the product.
      final String productPrice;
      // constructor and build method...
    }

<p align = "center">
  <img src="assets/images/product_template.png" alt="alt text" width="250" />
</p>

- ### User Template
- Shows the user's profile information, such as their name, email, phone, and address. Users can log out, view their cart, or navigate back to the previous screen.
    ```bash
    class UserTemplate extends StatelessWidget {
      // The callback function for when the back button is pressed.
      final VoidCallback? backonPressed;
      // The callback function for when the cart button is pressed.
      final VoidCallback? cartonPressed;
      // The callback function for when the log out button is pressed.
      final VoidCallback? logOutonPressed;
      // The user last name.
      final String lastName;
      // The user first name.
      final String name;
      // The user username.
      final String username;
      // The user email address.
      final String email;
      // The user phone number.
      final String phone;
      // The user city of residence.
      final String city;
      // The user street address.
      final String street;
      // The user street number.
      final String number;
      // The user postal code.
      final String zipcode;
      // constructor and build method...
    }
<p align = "center">
  <img src="assets/images/user_template.png" alt="alt text" width="250" />
</p>

## License
This project is licensed under the MIT License - see the LICENSE file for details.


