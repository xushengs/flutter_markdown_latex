import 'package:markdown/markdown.dart';

const _latexPattern =
    r'(\\\$|(?<!\\)\${1,2}|\\(?:\(|\[))(.*?)(\\(?:\)|\])|(?<!\\)\${1,2})';

class LatexInlineSyntax extends InlineSyntax {
  LatexInlineSyntax() : super(_latexPattern);

  @override
  bool onMatch(InlineParser parser, Match match) {
    if (match.groupCount < 3) {
      return false;
    }

    final equation = (match[2] ?? '').trim();
    if (equation.isEmpty) {
      return false;
    }

    final element = Element.text('latex', equation);
    element.attributes['displayMode'] = equation;
    parser.addNode(element);

    return true;
  }
}
