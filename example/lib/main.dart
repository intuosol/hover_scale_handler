import 'package:flutter/material.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Custom dark color scheme
  static ColorScheme darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9ad4a1),
      onPrimary: Color(0xff003916),
      primaryContainer: Color(0xff1a512a),
      onPrimaryContainer: Color(0xffb5f1bc),
      secondary: Color(0xffb7ccb6),
      onSecondary: Color(0xff233425),
      secondaryContainer: Color(0xff394b3b),
      onSecondaryContainer: Color(0xffd3e8d2),
      tertiary: Color(0xffa1ced8),
      onTertiary: Color(0xff00363e),
      tertiaryContainer: Color(0xff204d55),
      onTertiaryContainer: Color(0xffbdeaf4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101510),
      onSurface: Color(0xffdfe4dc),
      surfaceTint: Color(0xff9ad4a1),
      outline: Color(0xff8b9389),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4dc),
      onInverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff336940),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = darkColorScheme();

    return MaterialApp(
      title: 'HoverScaleHandler Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(colorScheme: colorScheme),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isButtonEnabled = true;

  // Custom parameters
  double _customScaleValue = 1.15;
  int _customAnimationDuration = 150;
  bool _enableHapticFeedback = false;
  Curve _selectedCurve = Curves.easeInOut;

  // Default values for reset
  static const double defaultScaleValue = 1.15;
  static const int defaultAnimationDuration = 150;
  static final Curve defaultCurve = Curves.easeInOut;

  void _resetCustomParameters() {
    setState(() {
      _customScaleValue = defaultScaleValue;
      _customAnimationDuration = defaultAnimationDuration;
      _enableHapticFeedback = false;
      _selectedCurve = defaultCurve;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.black87)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if we're on a small screen
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.surfaceTint.withValues(alpha: 0.1),
        title: const Text(
          'HOVER SCALE HANDLER DEMO',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Basic Examples section
                    _buildSectionHeader('BASIC EXAMPLES'),

                    const SizedBox(height: 16.0),

                    // Basic examples in a responsive layout
                    Wrap(
                      spacing: 24.0,
                      runSpacing: 24.0,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        // Example 1: Button with counter
                        _buildExampleContainer(
                          title: 'Button & Counter',
                          height: 150.0,
                          infoTooltip:
                              'scaleOnHover: 1.1\nanimationDuration: 100ms\nenableFeedback: true\ncurve: Curves.easeInOut',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HoverScaleHandler(
                                tooltip: 'Click to increment',
                                onTap: _incrementCounter,
                                scaleOnHover: 1.1,
                                enableFeedback: true,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Text(
                                    'INCREMENT',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'COUNT',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF252525),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    child: Text(
                                      '$_counter',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  HoverScaleHandler(
                                    scaleOnHover: 1.1,
                                    tooltip: 'Reset counter',
                                    onTap: _resetCounter,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 6.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerLowest,
                                        borderRadius: BorderRadius.circular(
                                          4.0,
                                        ),
                                      ),
                                      child: const Text(
                                        'RESET',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Example 2: Material Button
                        _buildExampleContainer(
                          title: 'Material Button',
                          height: 150.0,
                          infoTooltip:
                              'scaleOnHover: 1.5\nanimationDuration: 300ms\ncurve: Curves.easeInOut',
                          child: HoverScaleHandler(
                            scaleOnHover: 1.5,
                            animationDuration: Duration(milliseconds: 300),
                            onTap: () {
                              _showSnackBar('Material button pressed');
                            },
                            child: ElevatedButton.icon(
                              onPressed:
                                  null, // We handle the tap with HoverScaleHandler
                              icon: const Icon(
                                Icons.rocket_launch,
                                color: Colors.black87,
                              ),
                              label: Text(
                                'LAUNCH',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Colors.black87,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),

                        // Example 3: Image
                        _buildExampleContainer(
                          title: 'Image',
                          height: 150.0,
                          infoTooltip:
                              'scaleOnHover: 1.25\nanimationDuration: 300ms\ncurve: Curves.bounceOut',
                          child: HoverScaleHandler(
                            scaleOnHover: 1.25,
                            animationDuration: Duration(milliseconds: 300),
                            curve: Curves.bounceOut,
                            onTap: () {
                              _showSnackBar('Image tapped');
                            },
                            child: FlutterLogo(size: 60.0),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    // More examples
                    Wrap(
                      spacing: 24.0,
                      runSpacing: 24.0,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        // Example 4: Card
                        _buildExampleContainer(
                          title: 'Card',
                          height: 200.0,
                          infoTooltip:
                              'scaleOnHover: 1.05\nanimationDuration: 500ms\ncurve: Curves.linearToEaseOut',
                          child: HoverScaleHandler(
                            scaleOnHover: 1.05,
                            animationDuration: Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut,
                            onTap: () {
                              _showSnackBar('Card tapped');
                            },
                            child: Container(
                              width: 200.0,
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(color: Colors.grey.shade800),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(0, 3),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.security,
                                    size: 40.0,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(height: 12.0),
                                  const Text(
                                    'SECURITY MODULE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    'Tap to activate security protocols',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Example 5: Toggle button
                        _buildExampleContainer(
                          title: 'Toggle Button',
                          height: 200.0,
                          infoTooltip:
                              'Dynamic example: onTap is null when toggle is off\nHover effects are disabled when the toggle is off',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('SYSTEM STATUS:'),
                                  const SizedBox(width: 8.0),
                                  Switch(
                                    value: _isButtonEnabled,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isButtonEnabled = value;
                                      });
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    activeTrackColor: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withValues(alpha: 0.5),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12.0),
                              HoverScaleHandler(
                                tooltip:
                                    _isButtonEnabled
                                        ? 'System active'
                                        : 'System inactive',
                                onTap:
                                    _isButtonEnabled
                                        ? () {
                                          _showSnackBar('System activated');
                                        }
                                        : null,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                    vertical: 16.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _isButtonEnabled
                                            ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                            : Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        _isButtonEnabled
                                            ? Icons.power
                                            : Icons.power_off,
                                        color:
                                            _isButtonEnabled
                                                ? Colors.black87
                                                : Colors.grey,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        _isButtonEnabled
                                            ? 'ACTIVE'
                                            : 'INACTIVE',
                                        style: TextStyle(
                                          color:
                                              _isButtonEnabled
                                                  ? Colors.black87
                                                  : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                _isButtonEnabled
                                    ? 'Hover effects enabled'
                                    : 'Hover effects disabled',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color:
                                      _isButtonEnabled
                                          ? Theme.of(
                                            context,
                                          ).colorScheme.primary
                                          : Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Example 6: Action Buttons
                        _buildExampleContainer(
                          title: 'Action Buttons',
                          height: 200.0,
                          infoTooltip:
                              'Multiple HoverScaleHandlers with shared properties:\nscaleOnHover: 1.1\nanimationDuration: 100ms',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'COMMAND CENTER',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildActionButton(
                                    icon: Icons.shield,
                                    label: 'DEFEND',
                                    color: Colors.blue,
                                    onTap:
                                        () =>
                                            _showSnackBar('Defense activated'),
                                  ),
                                  const SizedBox(width: 16.0),
                                  _buildActionButton(
                                    icon: Icons.arrow_forward,
                                    label: 'DEPLOY',
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    onTap:
                                        () => _showSnackBar('Units deployed'),
                                  ),
                                  const SizedBox(width: 16.0),
                                  _buildActionButton(
                                    icon: Icons.warning_amber,
                                    label: 'ALERT',
                                    color: Colors.orange,
                                    onTap: () => _showSnackBar('Alert issued'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 48.0),

                    // Customizable Parameters section
                    _buildSectionHeader('CUSTOMIZATION MODULE'),

                    const SizedBox(height: 16.0),

                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'CONFIGURE PARAMETERS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
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
                                    border: Border.all(
                                      color: Colors.grey.shade700,
                                    ),
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                  SizedBox(
                                    width: 250.0,
                                    child: _buildCustomExample(),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: primaryColor.withValues(alpha: 0.5),
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(width: 12.0, height: 24.0, color: primaryColor),
          const SizedBox(width: 12.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  // Helper to create example card containers
  Widget _buildExampleContainer({
    required String title,
    required Widget child,
    required double height,
    String? infoTooltip,
  }) {
    final borderColor = Colors.grey.shade800;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: 300.0,
      constraints: BoxConstraints(minHeight: height),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF232323),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(7.0),
              ),
              border: Border(bottom: BorderSide(color: borderColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (infoTooltip != null) const SizedBox(width: 24.0),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                if (infoTooltip != null)
                  HoverScaleHandler(
                    scaleOnHover: 1.2,
                    animationDuration: const Duration(milliseconds: 100),
                    child: Tooltip(
                      message: infoTooltip,
                      waitDuration: const Duration(milliseconds: 400),
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      preferBelow: false,
                      child: Icon(
                        Icons.info_outline,
                        size: 16.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: child),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return HoverScaleHandler(
      onTap: onTap,
      scaleOnHover: 1.1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 8.0),
          // Label
          Text(
            label,
            style: TextStyle(
              fontSize: 10.0,
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  // UI helper for parameter value display
  Widget _buildValueDisplay(String text, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'monospace', color: textColor),
      ),
    );
  }

  // Scale parameter controls
  Widget _buildScaleControl() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        const Text('HOVER SCALE:', style: TextStyle(fontSize: 14.0)),
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
        const Text('DURATION:', style: TextStyle(fontSize: 14.0)),
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

  // Haptic feedback control
  Widget _buildHapticFeedbackControl() {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        const Text('HAPTIC FEEDBACK:', style: TextStyle(fontSize: 14.0)),
        const SizedBox(width: 8.0),
        Switch(
          value: _enableHapticFeedback,
          onChanged: (bool value) {
            setState(() {
              _enableHapticFeedback = value;
            });
          },
          activeColor: primaryColor,
          activeTrackColor: primaryColor.withValues(alpha: 0.5),
        ),
        const SizedBox(width: 8.0),
        Text(
          _enableHapticFeedback ? 'ENABLED' : 'DISABLED',
          style: TextStyle(
            fontSize: 12.0,
            color: _enableHapticFeedback ? primaryColor : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
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
        const Text('ANIMATION CURVE:', style: TextStyle(fontSize: 14.0)),
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

  // Combines all parameter controls
  Widget _buildParameterControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScaleControl(),
        const SizedBox(height: 16.0),
        _buildDurationControl(),
        const SizedBox(height: 16.0),
        _buildCurveSelector(),
        const SizedBox(height: 16.0),
        _buildHapticFeedbackControl(),
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
      onTap: () {
        _showSnackBar('Custom button tapped');
      },
      scaleOnHover: _customScaleValue,
      animationDuration: Duration(milliseconds: _customAnimationDuration),
      enableFeedback: _enableHapticFeedback,
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

  // Helper to get curve name for display
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
}
