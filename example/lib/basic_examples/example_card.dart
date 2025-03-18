import 'package:flutter/material.dart';
import 'package:widget_snippet/widget_snippet.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    super.key,
    required this.title,
    required this.child,
    required this.codeSnippet,
  });

  final String title;
  final Widget child;
  final String codeSnippet;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 230,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            Expanded(child: Center(child: child)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        border: Border(bottom: BorderSide()),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          IconButton.outlined(
            tooltip: 'View source code',
            visualDensity: VisualDensity.compact,
            onPressed: () {
              WidgetSnippet.showModal(
                context: context,
                sourceCode: codeSnippet,
                config: WidgetSnippetConfig(title: '$title Code Snippet'),
              );
            },
            icon: Icon(Icons.code),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
