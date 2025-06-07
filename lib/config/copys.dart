import 'package:fake_store_design/config/atomic_design_config.dart';

abstract class Copys {
  static String get appbartTexthome =>
      AtomicDesignConfig.instance.config.copys.appBartText['appbartTexthome']!;

  static String get loginTitle =>
      AtomicDesignConfig.instance.config.copys.loginText["title"]!;

  static String get loginSubtitle =>
      AtomicDesignConfig.instance.config.copys.loginText["subtitle"]!;

  static String get loginLabelUsername =>
      AtomicDesignConfig.instance.config.copys.loginText["labelUsername"]!;

  static String get loginLabelPassword =>
      AtomicDesignConfig.instance.config.copys.loginText["labelPassword"]!;

  static String get loginTitleButtonLogin =>
      AtomicDesignConfig.instance.config.copys.loginText["titleButtonLogin"]!;

  static String get productContainerText =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .productContainerText["productTextButton"]!;

  static String get errorMessageFirstMessage =>
      AtomicDesignConfig.instance.config.copys.errorMessage["firstMessage"]!;

  static String get errorMessageSecondMessage =>
      AtomicDesignConfig.instance.config.copys.errorMessage["secondMessage"]!;

  static String get companyInformationAddress =>
      AtomicDesignConfig.instance.config.copys.companyInformation["address"]!;

  static String get companyInformationEmail =>
      AtomicDesignConfig.instance.config.copys.companyInformation["email"]!;

  static String get companyInformationInstagram =>
      AtomicDesignConfig.instance.config.copys.companyInformation["instagram"]!;

  static String get companyInformationWhatsapp =>
      AtomicDesignConfig.instance.config.copys.companyInformation["whatsapp"]!;

  static String get searchAnchorWidget =>
      AtomicDesignConfig.instance.config.copys.searchAnchorWidget["hintText"]!;

  static String get infoUserHolderUserinfo =>
      AtomicDesignConfig.instance.config.copys.infoUserHolder["textUserinfo"]!;

  static String get infoUserHolderUserlocation =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .infoUserHolder["textUserlocation"]!;

  static String get customDialogsEmptycart =>
      AtomicDesignConfig.instance.config.copys.customDialogs.emptyCart;

  static String get customDialogsTotalToPay =>
      AtomicDesignConfig.instance.config.copys.customDialogs.totalToPay;

  static String get customDialogsAuthenticatedAlert =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customDialogs
          .authenticatedUser['alertText']!;

  static String get customDialogsAuthenticatedTitle =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customDialogs
          .authenticatedUser['titleTextButton']!;

  static String get customDialogsUnAuthenticatedTitle =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customDialogs
          .unAuthenticatedUser['titleTextButton']!;

  static String get customDialogsUnAuthenticatedAlert =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customDialogs
          .unAuthenticatedUser['alertText']!;

  static String get floatingNotificationsNotAdd =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customFloatingNotifications['notAdd']!;

  static String get floatingNotificationsAlready =>
      AtomicDesignConfig
          .instance
          .config
          .copys
          .customFloatingNotifications['alreadyAdd']!;
}
