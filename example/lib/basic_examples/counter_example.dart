import 'package:flutter/material.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';
import 'package:hover_scale_handler_example/basic_examples/example_card.dart';
import 'package:hover_scale_handler_example/source_code_generator.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter = 0;

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

  @override
  Widget build(BuildContext context) {
    return ExampleCard(
      title: 'Button & Counter',
      codeSnippet: SourceCodeGenerator.getCounterExampleSourceCode(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HoverScaleHandler(
            tooltip: 'Click to increment',
            onTap: _incrementCounter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'INCREMENT',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              const SizedBox(height: 4.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              HoverScaleHandler(
                tooltip: 'Reset counter',
                onTap: _resetCounter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(4.0),
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
    );
  }
}
