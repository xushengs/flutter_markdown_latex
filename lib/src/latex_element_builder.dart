import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:markdown/markdown.dart' as md;

class LatexElementBuilder extends MarkdownElementBuilder {
  TextStyle? textStyle;

  LatexElementBuilder({this.textStyle});

  @override
  Widget visitElementAfterWithContext(BuildContext context, md.Element element,
      TextStyle? preferredStyle, TextStyle? parentStyle) {
    final String? displayMode = element.attributes['displayMode'];
    final String text = element.textContent;
    if (text.isEmpty) {
      return const SizedBox();
    }

    return Math.tex(
      text,
      mathStyle: displayMode == 'true' ? MathStyle.display : MathStyle.text,
      textStyle: textStyle,
    );
  }
}
