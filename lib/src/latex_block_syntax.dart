import 'package:markdown/markdown.dart';

class LatexBlockSyntax extends BlockSyntax {
  @override
  RegExp get pattern => RegExp(r'^(\${1,2})$', multiLine: true);

  LatexBlockSyntax() : super();

  @override
  List<Line> parseChildLines(BlockParser parser) {
    final childLines = <Line>[];
    parser.advance();

    while (!parser.isDone) {
      final match = pattern.hasMatch(parser.current.content);
      if (!match) {
        childLines.add(parser.current);
        parser.advance();
      } else {
        parser.advance();
        break;
      }
    }

    return childLines;
  }

  @override
  Node parse(BlockParser parser) {
    final lines = parseChildLines(parser);
    final content = lines.map((e) => e.content).join('\n');
    final element = Element('p', [Element.text('latex', content)]);
    element.attributes['displayMode'] = 'true';
    return element;
  }
}
