import 'package:markdown/markdown.dart';

class LatexInlineSyntax extends InlineSyntax {
  LatexInlineSyntax()
      : super(
            r'(\${1,2})(?!\$)((?:\\.|[^\\\n])*?(?:\\.|[^\\\n\$]))\1(?=[\s?!\.,:？！。，：]|$)');

  @override
  bool onMatch(InlineParser parser, Match match) {
    Element element = Element.text('latex', match[2] ?? '');
    element.attributes['displayMode'] =
        match[1]?.length == 2 ? 'true' : 'false';
    parser.addNode(element);
    return true;
  }
}
