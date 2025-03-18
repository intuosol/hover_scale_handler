import 'package:flutter/material.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';
import 'package:hover_scale_handler_example/source_code_generator.dart';
import 'package:widget_snippet/widget_snippet.dart';

class CustomizerPlayground extends StatefulWidget {
  const CustomizerPlayground({super.key});

  static const double defaultScaleValue = 1.15;
  static const int defaultAnimationDuration = 150;
  static final Curve defaultCurve = Curves.easeInOut;

  @override
  State<CustomizerPlayground> createState() => _CustomizerPlaygroundState();
}

class _CustomizerPlaygroundState extends State<CustomizerPlayground> {
  // Custom parameters
  double _customScaleValue = 1.15;
  int _customAnimationDuration = 150;
  Curve _selectedCurve = Curves.easeInOut;

  void _resetCustomParameters() {
    setState(() {
      _customScaleValue = CustomizerPlayground.defaultScaleValue;
      _customAnimationDuration = CustomizerPlayground.defaultAnimationDuration;
      _selectedCurve = CustomizerPlayground.defaultCurve;
    });
  }

  // Returns the curve name as a string
  String _getCurveName(Curve curve) {
    final Map<Curve, String> curveNames = {
      Curves.easeInOut: 'easeInOut',
      Curves.easeIn: 'easeIn',
      Curves.easeOut: 'easeOut',
      Curves.linear: 'linear',
      Curves.decelerate: 'decelerate',
      Curves.fastOutSlowIn: 'fastOutSlowIn',
      Curves.bounceIn: 'bounceIn',
      Curves.bounceOut: 'bounceOut',
      Curves.elasticIn: 'elasticIn',
      Curves.elasticOut: 'elasticOut',
    };

    return curveNames[curve] ?? 'custom';
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Customize',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              IconButton.outlined(
                tooltip: 'View source code',
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  WidgetSnippet.showModal(
                    context: context,
                    sourceCode:
                        SourceCodeGenerator.getCustomizerPlaygroundSourceCode(
                          curveName: _getCurveName(_selectedCurve),
                          customScaleValue: _customScaleValue,
                          customAnimationDuration: _customAnimationDuration,
                        ),
                    config: WidgetSnippetConfig(
                      title: 'Customized Code Snippet',
                    ),
                  );
                },
                icon: Icon(Icons.code),
              ),
              const SizedBox(width: 8.0),
              HoverScaleHandler(
                tooltip: 'Reset to defaults',
                onTap: _resetCustomParameters,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.grey.shade700),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.refresh, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        'RESET',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),

          // Note about animation curves
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 18.0,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'TIP: Increase the Duration (300-500ms) to see animation curves more prominently.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24.0),

          // Parameter controls
          isSmallScreen
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildParameterControls(),
                  const SizedBox(height: 24.0),
                  _buildCustomExample(),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildParameterControls()),
                  const SizedBox(width: 32.0),
                  SizedBox(width: 250.0, child: _buildCustomExample()),
                ],
              ),
        ],
      ),
    );
  }

  // Builds the parameter controls
  Widget _buildParameterControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScaleControl(),
        const SizedBox(height: 16.0),
        _buildDurationControl(),
        const SizedBox(height: 16.0),
        _buildCurveSelector(),
      ],
    );
  }

  // Scale parameter controls
  Widget _buildScaleControl() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        const Text('Hover Scale:', style: TextStyle(fontSize: 14.0)),
        Expanded(
          child: Slider(
            value: _customScaleValue,
            min: 1.0,
            max: 1.5,
            divisions: 10,
            activeColor: primaryColor,
            inactiveColor: const Color(0xFF2C2C2C),
            label: _customScaleValue.toStringAsFixed(2),
            onChanged: (double value) {
              setState(() {
                _customScaleValue = value;
              });
            },
          ),
        ),
        _buildValueDisplay(
          '${_customScaleValue.toStringAsFixed(2)}x',
          primaryColor,
        ),
      ],
    );
  }

  // Duration parameter controls
  Widget _buildDurationControl() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        const Text('Duration:', style: TextStyle(fontSize: 14.0)),
        Expanded(
          child: Slider(
            value: _customAnimationDuration.toDouble(),
            min: 50.0,
            max: 500.0,
            divisions: 9,
            activeColor: primaryColor,
            inactiveColor: const Color(0xFF2C2C2C),
            label: '${_customAnimationDuration}ms',
            onChanged: (double value) {
              setState(() {
                _customAnimationDuration = value.toInt();
              });
            },
          ),
        ),
        _buildValueDisplay('${_customAnimationDuration}ms', primaryColor),
      ],
    );
  }

  // Curve selector dropdown
  Widget _buildCurveSelector() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    // List of common curves with display names
    final Map<String, Curve> curveOptions = {
      'easeInOut': Curves.easeInOut,
      'easeIn': Curves.easeIn,
      'easeOut': Curves.easeOut,
      'linear': Curves.linear,
      'decelerate': Curves.decelerate,
      'fastOutSlowIn': Curves.fastOutSlowIn,
      'bounceIn': Curves.bounceIn,
      'bounceOut': Curves.bounceOut,
      'elasticIn': Curves.elasticIn,
      'elasticOut': Curves.elasticOut,
    };

    return Row(
      children: [
        const Text('Animation Curve:', style: TextStyle(fontSize: 14.0)),
        const SizedBox(width: 16.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Colors.grey.shade700),
            ),
            child: DropdownButton<String>(
              value:
                  curveOptions.entries
                      .firstWhere((entry) => entry.value == _selectedCurve)
                      .key,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              dropdownColor: const Color(0xFF262626),
              underline: const SizedBox(),
              style: TextStyle(color: primaryColor),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedCurve = curveOptions[newValue]!;
                  });
                }
              },
              items:
                  curveOptions.keys.map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(
                        key,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Displays the value of a parameter
  Widget _buildValueDisplay(String text, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }

  // Preview section for the customizable example
  Widget _buildCustomExample() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'PREVIEW',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0),
        ),
        const SizedBox(height: 16.0),
        Transform.scale(scale: 0.8, child: _buildPreviewButton()),
      ],
    );
  }

  // Custom preview button used for the example
  Widget _buildPreviewButton() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Get the curve name for display
    final String curveName = _getCurveName(_selectedCurve);

    return HoverScaleHandler(
      tooltip: 'Custom hover effect',
      onTap: () {},
      scaleOnHover: _customScaleValue,
      animationDuration: Duration(milliseconds: _customAnimationDuration),
      curve: _selectedCurve,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: primaryColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: primaryColor, width: 2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.touch_app, size: 40.0, color: primaryColor),
            const SizedBox(height: 16.0),
            const Text(
              'TAP ME',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Scale: ${_customScaleValue.toStringAsFixed(2)}x\n'
              'Duration: ${_customAnimationDuration}ms\n'
              'Curve: $curveName',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
