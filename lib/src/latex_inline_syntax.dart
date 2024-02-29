import 'package:markdown/markdown.dart';

const _latexPattern =
    r'(?:(\${1,2})(?!\$)((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\$]))\1(?=[\s?!\.,:？！。，：]|$))|(?:(\\\()(?!\\\))((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\\\)]))\\\)(?=[\s?!\.,:？！。，：]|$))';

class LatexInlineSyntax extends InlineSyntax {
  LatexInlineSyntax() : super(_latexPattern);

  @override
  bool onMatch(InlineParser parser, Match match) {
    if (match.groupCount < 3) {
      return false;
    }

    String equation = (match[2] ?? '').trim();
    if (equation.isEmpty) {
      equation = (match[4] ?? '').trim();
    }

    String raw = match.group(0) ?? '';

    String mathStyle;
    if (raw.startsWith('\$\$') && raw.endsWith('\$\$')) {
      mathStyle = 'display';
    } else {
      mathStyle = 'text';
    }

    final element = Element.text('latex', equation);
    element.attributes['MathStyle'] = mathStyle;
    parser.addNode(element);

    return true;
  }
}
