import 'package:flutter/material.dart';
import 'package:hover_scale_handler_example/basic_examples/animation_example.dart';
import 'package:hover_scale_handler_example/basic_examples/counter_example.dart';
import 'package:hover_scale_handler_example/basic_examples/toggle_example.dart';
import 'package:hover_scale_handler_example/features/customizer_playground.dart';
import 'package:intuosol_design_system/intuosol_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return IntuoSolApp(
      title: 'HoverScaleHandler Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntuoSolScaffold(
      appBar: AppBar(title: const Text('Hover Scale Handler Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Basic Examples section
                IntuoSolSectionHeader(
                  title: 'Basic Examples',
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),

                Wrap(
                  spacing: 24.0,
                  runSpacing: 24.0,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    // Example 1: Button with counter
                    CounterExample(),

                    // Example 2: Toggle button
                    ToggleExample(),

                    // Example 3: Animated button
                    AnimationExample(),
                  ],
                ),

                const SizedBox(height: 48.0),

                // Customizer Playground
                IntuoSolSectionHeader(
                  title: 'Customizer Playground',
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),

                // Customizer Playground
                CustomizerPlayground(),
                const SizedBox(height: 48.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IntuoSolButtons.floatingAboutPackage(
        context: context,
        packageName: 'hover_scale_handler',
        description:
            'A Flutter widget that adds hover and tap scale animations to any widget, enhancing user interaction with visual feedback.',
      ),
    );
  }
}
