import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound(this.error, {Key? key}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404 Not Found')), // TODO localization
      body: const Center(
        child: Text('Oops! Page not found.'), // TODO localization
      ),
    );
  }
}
