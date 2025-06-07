class AppConfig {
  final Map<String, String> colors;
  final Map<String, double> spacing;
  final Map<String, double> radius;
  final TypographyJson typography;
  final CopysJson copys;

  AppConfig({
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.typography,
    required this.copys,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      colors: Map<String, String>.from(json['colors']),
      spacing: Map<String, double>.from(json['spacing']),
      radius: Map<String, double>.from(json['radius']),
      typography: TypographyJson.fromJson(json['typography']),
      copys: CopysJson.fromJson(json['copys']),
    );
  }
}

class TypographyJson {
  final Map<String, String> fonts;
  final Map<String, double> sizes;

  TypographyJson({required this.fonts, required this.sizes});

  factory TypographyJson.fromJson(Map<String, dynamic> json) {
    return TypographyJson(
      fonts: Map<String, String>.from(json['fonts']),
      sizes: Map<String, double>.from(json['sizes']),
    );
  }
}

class CopysJson {
  final Map<String, String> appBartText;
  final Map<String, String> loginText;
  final Map<String, String> productContainerText;
  final Map<String, String> errorMessage;
  final Map<String, String> companyInformation;
  final Map<String, String> searchAnchorWidget;
  final Map<String, String> infoUserHolder;
  final CustomDialogJson customDialogs;
  final Map<String, String> customFloatingNotifications;
  final Map<String, String> images;

  CopysJson({
    required this.appBartText,
    required this.loginText,
    required this.productContainerText,
    required this.errorMessage,
    required this.companyInformation,
    required this.searchAnchorWidget,
    required this.infoUserHolder,
    required this.customDialogs,
    required this.customFloatingNotifications,
    required this.images,
  });

  factory CopysJson.fromJson(Map<String, dynamic> json) {
    return CopysJson(
      appBartText: Map<String, String>.from(json['appBartText']),
      loginText: Map<String, String>.from(json['loginText']),
      productContainerText: Map<String, String>.from(
        json['productContainerText'],
      ),
      errorMessage: Map<String, String>.from(json['errorMessage']),
      companyInformation: Map<String, String>.from(json['companyInformation']),
      searchAnchorWidget: Map<String, String>.from(json['searchAnchorWidget']),
      infoUserHolder: Map<String, String>.from(json['infoUserHolder']),
      customDialogs: CustomDialogJson.fromJson(json['customDialogs']),
      customFloatingNotifications: Map<String, String>.from(
        json['customFloatingNotifications'],
      ),
      images: Map<String, String>.from(json['images']),
    );
  }
}

class CustomDialogJson {
  final String emptyCart;
  final String totalToPay;
  final Map<String, String> authenticatedUser;
  final Map<String, String> unAuthenticatedUser;

  CustomDialogJson({
    required this.emptyCart,
    required this.totalToPay,
    required this.authenticatedUser,
    required this.unAuthenticatedUser,
  });

  factory CustomDialogJson.fromJson(Map<String, dynamic> json) {
    return CustomDialogJson(
      emptyCart: json['emptycart'],
      totalToPay: json['totalToPay'],
      authenticatedUser: Map<String, String>.from(json['authenticatedUser']),
      unAuthenticatedUser: Map<String, String>.from(
        json['unAuthenticatedUser'],
      ),
    );
  }
}
