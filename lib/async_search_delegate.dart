import 'package:flutter/material.dart';

class AsyncSearchDelegate<T> extends SearchDelegate<T> {
  final Future<List<T>> Function(String) future;
  final ListTile Function(BuildContext, T) builder;

  AsyncSearchDelegate({
    @required this.future,
    @required this.builder,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget _searchResults() {
    return FutureBuilder<List<T>>(
      future: future(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => builder(
            context,
            snapshot.data[index],
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchResults();
  }
}
