class SemanticsText {
  final String label;
  final String semantics;
  final double semanticOrdinal;

  SemanticsText({
    required this.label,
    required this.semantics,
    required this.semanticOrdinal,
  });
}

abstract class PreJson {
  static List<SemanticsText> productInformationScreen = [
    SemanticsText(label: "Product Name", semanticOrdinal: 1.0, semantics: ''),
    SemanticsText(
      label: 'Favorite button double tap to add to the favroite list',
      semantics: '',
      semanticOrdinal: 2.0,
    ),
    SemanticsText(label: "Product Image", semantics: "", semanticOrdinal: 3.0),
    SemanticsText(
      label: "Product description",
      semanticOrdinal: 4.0,
      semantics: "",
    ),
    SemanticsText(
      label: "Actual price",
      semanticOrdinal: 5.0,
      semantics: "the product is on sale, normal price",
    ),
    SemanticsText(
      label: "Button to add product to the cart",
      semanticOrdinal: 6.0,
      semantics: "",
    ),
  ];

  static List<SemanticsText> custonsButtons = [
    SemanticsText(
      label: "return to the previous screen",
      semanticOrdinal: 0.0,
      semantics: '',
    ),
    SemanticsText(
      label: "go to the cart screen",
      semanticOrdinal: 0.0,
      semantics: '',
    ),
    SemanticsText(
      label: "go to the user information screen",
      semanticOrdinal: 0.0,
      semantics: '',
    ),
    SemanticsText(
      label: "go to the sign in screen",
      semanticOrdinal: 0.0,
      semantics: '',
    ),
    SemanticsText(label: "log out", semanticOrdinal: 0.0, semantics: ''),
    SemanticsText(label: "username", semanticOrdinal: 0.0, semantics: ''),
  ];

  static List<SemanticsText> inputTextSemantics = [
    SemanticsText(
      label: 'box to enter the username to log in double tap to edit text',
      semantics: '',
      semanticOrdinal: 0.0,
    ),
    SemanticsText(
      label: 'box to enter the password to log in double tap to edit text',
      semantics: '',
      semanticOrdinal: 0.0,
    ),
    SemanticsText(
      label: 'Icon to show the password',
      semantics: '',
      semanticOrdinal: 0.0,
    ),
  ];

  static List<SemanticsText> cartTemplateSemantics = [
    SemanticsText(
      label: 'Product Image',
      semantics: 'Double tap to navigate to the product information screen',
      semanticOrdinal: 1.0,
    ),
    SemanticsText(label: 'Product name', semantics: '', semanticOrdinal: 2.0),
    SemanticsText(
      label: 'Amount of products',
      semantics: '',
      semanticOrdinal: 3.0,
    ),
    SemanticsText(
      label: 'Product description',
      semantics: '',
      semanticOrdinal: 4.0,
    ),
    SemanticsText(label: '', semantics: '', semanticOrdinal: 5.0),
    SemanticsText(
      label: 'Increase the amount of the product',
      semantics: '',
      semanticOrdinal: 6.0,
    ),
    SemanticsText(
      label: 'Decrease the amount of the product',
      semantics: '',
      semanticOrdinal: 7.0,
    ),
  ];

  static List<SemanticsText> customDialogsMessage = [
    SemanticsText(
      label: 'Press the continue button to complete the purchase',
      semantics: "Go to the home screen",
      semanticOrdinal: 0.0,
    ),
    SemanticsText(
      label: "you need to be authenticated to continue with the shoping",
      semantics: "Go to the sign in screen",
      semanticOrdinal: 0.0,
    ),
  ];

  static List<SemanticsText> productHomeContainer = [
    SemanticsText(
      label: 'Product Image',
      semantics: 'Double tap to navigate to the product information screen',
      semanticOrdinal: 1.0,
    ),
    SemanticsText(label: "Product Name", semanticOrdinal: 2.0, semantics: ''),
    SemanticsText(
      label: 'Favorite button double tap to add to the favroite list',
      semantics: '',
      semanticOrdinal: 3.0,
    ),
    SemanticsText(
      label: 'Product category',
      semantics: '',
      semanticOrdinal: 4.0,
    ),
    SemanticsText(label: '', semantics: '', semanticOrdinal: 5.0),
    SemanticsText(
      label: 'Button to add product to the cart',
      semantics: '',
      semanticOrdinal: 6.0,
    ),
  ];

  static List<SemanticsText> homeTemplate = [
    SemanticsText(
      label: 'Box to search products by their name',
      semantics: '',
      semanticOrdinal: 1.0,
    ),
    SemanticsText(
      label: 'Scrollable bar that separates the products by their category',
      semantics: '',
      semanticOrdinal: 2.0,
    ),
    SemanticsText(
      label: 'Please wait a moment, the products are loading',
      semantics: '',
      semanticOrdinal: 3.0,
    ),
    SemanticsText(label: '', semantics: '', semanticOrdinal: 4.0),
    SemanticsText(label: 'Product', semantics: '', semanticOrdinal: 5.0),
    SemanticsText(
      label: 'Company information',
      semantics: '',
      semanticOrdinal: 6.0,
    ),
  ];
}
