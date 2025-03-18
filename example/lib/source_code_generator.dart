/// Helper class to generate source code
/// to display in the WidgetSnippet modal
class SourceCodeGenerator {
  SourceCodeGenerator._();

  static String getCounterExampleSourceCode() {
    return '''
 HoverScaleHandler(
  tooltip: 'Click to increment',
  onTap: _incrementCounter,
  child: ...
),''';
  }

  static String getToggleExampleSourceCode() {
    return '''
HoverScaleHandler(
  scaleOnHover: 1.15,
  onTap: _isButtonEnabled ? () {} : null,
  tooltip: _isButtonEnabled ? 'System active' : 'System inactive',
  child: _isButtonEnabled ? _activatedButton() : _deactivatedButton(),
),''';
  }

  static String getAnimationExampleSourceCode() {
    return '''
 HoverScaleHandler(
  onTap: () {},
  scaleOnHover: 1.2,
  tapAnimationDelay: Duration.zero,
  animationDuration: Duration(milliseconds: 750),
  curve: curve, // bounceOut, easeOutQuint, elasticInOut
  child: Column(
    children: [
      ...
    ],
  ),
)''';
  }

  static String getCustomizerPlaygroundSourceCode({
    required String curveName,
    required double customScaleValue,
    required int customAnimationDuration,
  }) {
    return '''
HoverScaleHandler(
  tooltip: 'Custom hover effect',
  onTap: () {},
  scaleOnHover: $customScaleValue,
  animationDuration: Duration(milliseconds: $customAnimationDuration),
  curve: Curves.$curveName,
  reverseCurve: Curves.fastLinearToSlowEaseIn,
  child: ...
)''';
  }
}
