import 'package:flutter/material.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';
import 'package:hover_scale_handler_example/basic_examples/example_card.dart';
import 'package:hover_scale_handler_example/source_code_generator.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  @override
  Widget build(BuildContext context) {
    return ExampleCard(
      title: 'Animation Example',
      codeSnippet: SourceCodeGenerator.getAnimationExampleSourceCode(),
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
            spacing: 32.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildActionButton(
                icon: Icons.shield,
                label: 'DEFEND',
                color: Colors.blue,
                curve: Curves.bounceOut,
              ),
              _buildActionButton(
                icon: Icons.arrow_forward,
                label: 'DEPLOY',
                color: Theme.of(context).colorScheme.primary,
                curve: Curves.easeOutQuint,
              ),
              _buildActionButton(
                icon: Icons.warning_amber,
                label: 'ALERT',
                color: Colors.orange,
                curve: Curves.elasticInOut,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Curve curve,
  }) {
    return HoverScaleHandler(
      onTap: () {},
      scaleOnHover: 1.2,
      tapAnimationDelay: Duration.zero,
      animationDuration: Duration(milliseconds: 750),
      curve: curve,
      reverseCurve: Curves.fastLinearToSlowEaseIn,
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
}
