import 'package:markdown/markdown.dart';

class LatexInlineSyntax extends InlineSyntax {
  // (?:(\${1,2})(?!\$)((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\$]))\1(?=[\s?!\.,:？！。，：]|$))
  // (?:(\\\()(?!\\\))((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\\\)]))\\\)(?=[\s?!\.,:？！。，：]|$))
  LatexInlineSyntax()
      : super(
            r'(?:(\${1,2})(?!\$)((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\$]))\1(?=[\s?!\.,:？！。，：]|$))|(?:(\\\()(?!\\\))((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\\\)]))\\\)(?=[\s?!\.,:？！。，：]|$))');

  @override
  bool onMatch(InlineParser parser, Match match) {
    Element element = Element.text('latex', match[2] ?? (match[4] ?? ''));
    element.attributes['displayMode'] = match[1] == '\$\$' ? 'true' : 'false';
    parser.addNode(element);
    return true;
  }
}
