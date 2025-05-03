import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CodolingoBlocCode extends StatelessWidget {
  final String code;
   CodolingoBlocCode({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child : 
      SyntaxView(
        code: code,
        syntax: Syntax.DART,
        syntaxTheme: SyntaxTheme.vscodeDark(),	// Theme
        fontSize: 12.0,
        withZoom: true,
        withLinesCount: true,
        expanded: false,
        selectable: true
      ),
    );
  }
}
