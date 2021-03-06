import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogs/customPackage/syntax_highlightstyle.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'animated_floating_action_btn.dart';

class SourceCodeView extends StatefulWidget {
  final String filePath;
  final String codeLinkPrefix;
  final double fontSize;

  const SourceCodeView(
      {Key key, @required this.filePath, this.codeLinkPrefix, this.fontSize})
      : super(key: key);

  String get codeLink => this.codeLinkPrefix == null
      ? null
      : '${this.codeLinkPrefix}/${this.filePath}';

  @override
  _SourceCodeViewState createState() {
    return _SourceCodeViewState();
  }
}

class _SourceCodeViewState extends State<SourceCodeView> {
  double _textScaleFactor = 1.0;

  Widget _getCodeView(String codeContent, BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();
    return Container(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: SelectableText.rich(
            TextSpan(
              style:
                  TextStyle(fontFamily: 'monospace', fontSize: widget.fontSize)
                      .apply(fontSizeFactor: this._textScaleFactor),
              children: <TextSpan>[
                DartSyntaxHighlighter(style).format(codeContent)
              ],
            ),
            style: DefaultTextStyle.of(context)
                .style
                .apply(fontSizeFactor: this._textScaleFactor),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingButtons({String code}) {
    return <Widget>[
      //if (this.widget.codeLink != null)
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.content_copy),
        tooltip: 'Copy code link to clipboard',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: code));
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Code link copied to clipboard!'),
          ));
        },
      ),
      if (this.widget.codeLink != null)
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.open_in_new),
          tooltip: 'View code in browser',
          onPressed: () => url_launcher.launch(this.widget.codeLink),
        ),
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () => setState(() {
          this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
        }),
      ),
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () => setState(() {
          this._textScaleFactor += 0.1;
        }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.filePath) ??
          'Error loading source code from $this.filePath',
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data, context),
            ),
            floatingActionButton: AnimatedFloatingActionButton(
              fabButtons: _buildFloatingButtons(code: snapshot.data),
              colorStartAnimation: Colors.blue,
              colorEndAnimation: Colors.red,
              animatedIconData: AnimatedIcons.menu_close,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
