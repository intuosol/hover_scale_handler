# HoverScaleHandler <img src="https://raw.githubusercontent.com/intuosol/intuosol_design_system/main/assets/logos/by_intuosol.png" alt="Icon" width="250" style="margin-left: 20px;">

[![platform](https://img.shields.io/badge/platform-flutter-blue.svg)](https://flutter.dev)
[![pub package](https://img.shields.io/pub/v/hover_scale_handler.svg)](https://pub.dev/packages/hover_scale_handler)
[![pub points](https://img.shields.io/pub/points/hover_scale_handler)](https://pub.dev/packages/hover_scale_handler/score)
[![documentation](https://img.shields.io/badge/api-documentation-blue.svg)](https://pub.dev/documentation/hover_scale_handler)
[![interactive demo](https://img.shields.io/badge/interactive-demo-white.svg)](https://intuosol.github.io/hover_scale_handler/)
[![last updated](https://img.shields.io/github/last-commit/intuosol/hover_scale_handler.svg)](https://github.com/intuosol/hover_scale_handler/commits/main)
[![by](https://img.shields.io/badge/by-IntuoSol-success.svg)](https://intuosol.com)

A Flutter widget that adds hover and tap scale animations to any widget, enhancing user interaction with visual feedback.

Try it out in the [demo app](https://intuosol.github.io/hover_scale_handler/).

## Features

- Scales widgets up when hovered over with a mouse
- Provides tap animation feedback
- Works with any Flutter widget
- Customizable tooltip support
- Simple and easy to use

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
  curve: Curves.easeInOut, // Animation curve when hovering and tapping
  reverseCurve: null, // Animation curve on hover exit (uses curve if null)

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
  curve: Curves.bounceOut, // Bouncy animation on hover and tap
  reverseCurve: Curves.easeOut, // Smooth animation on hover exit
  onTap: () => print('Tapped with bounce effect'),
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
