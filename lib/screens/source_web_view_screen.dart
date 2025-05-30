import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String title;
  final String sourceUrl;

  const ArticleWebView({
    super.key,
    required this.title,
    required this.sourceUrl,
  });

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() {
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                setState(() {
                  _isLoading = true;
                  _errorMessage = "";
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebResourceError: (WebResourceError error) {
                setState(() {
                  _isLoading = false;
                  _errorMessage = "Error loading page: ${error.description}";
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.sourceUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Chip(
          label: Text(
            widget.title,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        elevation: 1,
      ),
      body: Stack(
        children: [
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_errorMessage.isNotEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_errorMessage),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reload();
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            ),
          WebViewWidget(controller: _controller),
        ],
      ),
    );
  }
}
