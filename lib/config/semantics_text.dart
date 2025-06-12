class SemanticsText {
  final String label;
  final String semantics;
  final double semanticOrdinal;

  SemanticsText({
    required this.label,
    required this.semantics,
    required this.semanticOrdinal,
  });

  factory SemanticsText.fromJson(Map<String, dynamic> json) {
    return SemanticsText(
      label: json['label'] ?? '',
      semantics: json['semantics'] ?? '',
      semanticOrdinal: (json['semanticOrdinal'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'semantics': semantics,
      'semanticOrdinal': semanticOrdinal,
    };
  }
}
