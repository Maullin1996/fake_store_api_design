import 'package:fake_store_design/config/semantics_text.dart';

class SemanticsData {
  final List<SemanticsText> productInformationScreen;
  final List<SemanticsText> customButtons;
  final List<SemanticsText> inputTextSemantics;
  final List<SemanticsText> cartTemplateSemantics;
  final List<SemanticsText> customDialogsMessage;
  final List<SemanticsText> productHomeContainer;
  final List<SemanticsText> homeTemplate;

  SemanticsData({
    required this.productInformationScreen,
    required this.customButtons,
    required this.inputTextSemantics,
    required this.cartTemplateSemantics,
    required this.customDialogsMessage,
    required this.productHomeContainer,
    required this.homeTemplate,
  });

  factory SemanticsData.fromJson(Map<String, dynamic> json) {
    List<SemanticsText> parseList(String key) =>
        (json[key] as List).map((e) => SemanticsText.fromJson(e)).toList();

    return SemanticsData(
      productInformationScreen: parseList('productInformationScreen'),
      customButtons: parseList('customButtons'),
      inputTextSemantics: parseList('inputTextSemantics'),
      cartTemplateSemantics: parseList('cartTemplateSemantics'),
      customDialogsMessage: parseList('customDialogsMessage'),
      productHomeContainer: parseList('productHomeContainer'),
      homeTemplate: parseList('homeTemplate'),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listToJson(List<SemanticsText> list) =>
        list.map((e) => e.toJson()).toList();

    return {
      'productInformationScreen': listToJson(productInformationScreen),
      'customButtons': listToJson(customButtons),
      'inputTextSemantics': listToJson(inputTextSemantics),
      'cartTemplateSemantics': listToJson(cartTemplateSemantics),
      'customDialogsMessage': listToJson(customDialogsMessage),
      'productHomeContainer': listToJson(productHomeContainer),
      'homeTemplate': listToJson(homeTemplate),
    };
  }
}
