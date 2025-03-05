# HoverScaleHandler

[![pub package](https://img.shields.io/pub/v/hover_scale_handler.svg)](https://pub.dev/packages/hover_scale_handler)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight Flutter widget by IntuoSol that adds hover and tap scale animations to any widget, enhancing user interaction with visual feedback.

## Features

- Scales widgets up when hovered over with a mouse
- Provides tap animation feedback
- Works with any Flutter widget
- Customizable tooltip support
- Simple and easy to use

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  hover_scale_handler: ^1.0.0
```

## Usage

Import the package:

```dart
import 'package:hover_scale_handler/hover_scale_handler.dart';
```

Wrap any widget with `HoverScaleHandler` to add hover and tap animations:

```dart
HoverScaleHandler(
  tooltip: 'Click me', // Optional tooltip
  onTap: () {
    // Handle tap event
    print('Widget tapped!');
  },
  child: Container(
    padding: const EdgeInsets.all(16),
    color: Colors.blue,
    child: const Text(
      'Hover over me',
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

### Examples

#### Button with hover effect

```dart
HoverScaleHandler(
  tooltip: 'Click to increment',
  onTap: () {
    // Handle button press
  },
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      'Tap Me',
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

#### Card with hover effect

```dart
HoverScaleHandler(
  tooltip: 'Card example',
  onTap: () {
    // Handle card tap
  },
  child: Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.credit_card, size: 40),
          const SizedBox(height: 8),
          const Text('Interactive Card'),
        ],
      ),
    ),
  ),
)
```

#### List items with hover effect

```dart
HoverScaleHandler(
  tooltip: 'List item',
  onTap: () {
    // Handle item tap
  },
  child: ListTile(
    leading: const Icon(Icons.star),
    title: const Text('List Item'),
    subtitle: const Text('Tap or hover to interact'),
  ),
)
```

#### Icons with hover effect

```dart
HoverScaleHandler(
  tooltip: 'Like',
  onTap: () {
    // Handle icon tap
  },
  child: const Padding(
    padding: EdgeInsets.all(8.0),
    child: Icon(Icons.thumb_up, size: 30, color: Colors.blue),
  ),
)
```

### Customization Options

The `HoverScaleHandler` widget is highly customizable:

```dart
HoverScaleHandler(
  // Required parameters
  child: myWidget,
  
  // Optional parameters with their default values
  onTap: () {}, // If null, hover effect is disabled
  tooltip: '', // Tooltip text shown on hover
  scaleOnHover: 1.05, // Scale factor when hovering (1.05 = 5% larger)
  defaultScale: 1.0, // Default scale when not hovering
  animationDuration: const Duration(milliseconds: 100), // Animation duration
  tooltipWaitDuration: const Duration(milliseconds: 500), // Delay before showing tooltip
  tapAnimationDelay: const Duration(milliseconds: 50), // Additional delay after tap animation
  cursor: SystemMouseCursors.click, // Cursor to show when hovering
  
  // Animation customization
  curve: Curves.easeInOut, // Animation curve for scaling up
  reverseCurve: null, // Animation curve for scaling down (uses curve if null)
  
  // Behavior customization
  hitTestBehavior: HitTestBehavior.opaque, // Controls how hit testing works
  enableFeedback: false, // Whether to provide haptic feedback when tapped
)
```

#### Animation Curves

You can use different animation curves to control how the scaling effect behaves:

```dart
// Using a bounce effect for more playful animations
HoverScaleHandler(
  curve: Curves.bounceOut, // Bouncy animation when scaling up
  reverseCurve: Curves.easeOut, // Smooth animation when scaling down
  onTap: () => print('Tapped with bounce effect'),
  child: myWidget,
)
```

#### Hit Test Behavior

The `hitTestBehavior` parameter controls how the widget responds to gestures:

- `HitTestBehavior.opaque` (default): The widget will receive taps even if tapping on transparent parts
- `HitTestBehavior.translucent`: The widget and those below it will both receive taps
- `HitTestBehavior.deferToChild`: Only the non-transparent parts of the widget will receive taps

```dart
HoverScaleHandler(
  hitTestBehavior: HitTestBehavior.deferToChild,
  onTap: () => print('Only non-transparent areas are tappable'),
  child: myWidget,
)
```

#### Haptic Feedback

Enable haptic feedback for a more tactile experience on supported devices:

```dart
HoverScaleHandler(
  enableFeedback: true, // Provides haptic feedback when tapped
  onTap: () => print('Tapped with haptic feedback'),
  child: myWidget,
)
```

#### Disabling Hover Effect

If `onTap` is set to `null`, the hover scale effect will be disabled completely:

```dart
// This widget will not show hover effects or respond to taps
HoverScaleHandler(
  onTap: null, // Disable hover effects and tap functionality
  child: myWidget,
)
```

## Additional information

- Check out the `/example` folder for a complete demo app showing various use cases
- Works on all platforms supported by Flutter, but hover effects are most noticeable on desktop platforms
- Fully customizable with options for animation duration, scale values, and tooltip wait duration
- No third-party dependencies, just pure Flutter
- Lightweight and performant

## About

Developed and maintained by [IntuoSol](https://intuosol.com), a company dedicated to building high-quality Flutter packages and solutions.

## Contributing

Contributions are welcome! If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/intuosol/hover_scale_handler/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
