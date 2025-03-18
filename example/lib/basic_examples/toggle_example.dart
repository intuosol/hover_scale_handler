import 'package:flutter/material.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';
import 'package:hover_scale_handler_example/basic_examples/example_card.dart';
import 'package:hover_scale_handler_example/source_code_generator.dart';

class ToggleExample extends StatefulWidget {
  const ToggleExample({super.key});

  @override
  State<ToggleExample> createState() => _ToggleExampleState();
}

class _ToggleExampleState extends State<ToggleExample> {
  bool _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ExampleCard(
      title: 'Toggle Button',
      codeSnippet: SourceCodeGenerator.getToggleExampleSourceCode(),
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
                activeColor: Theme.of(context).colorScheme.primary,
                activeTrackColor: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.5),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          HoverScaleHandler(
            scaleOnHover: 1.15,
            onTap: _isButtonEnabled ? () {} : null,
            tooltip: _isButtonEnabled ? 'System active' : 'System inactive',
            child: _isButtonEnabled ? _activatedButton() : _deactivatedButton(),
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
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _activatedButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.power, color: Colors.black87),
          const SizedBox(width: 8.0),
          const Text(
            'ACTIVE',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _deactivatedButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.power_off, color: Colors.grey),
          const SizedBox(width: 8.0),
          const Text(
            'INACTIVE',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
