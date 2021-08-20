class Location {
  final String id;
  final String name;
  final String vendor;

  Location.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        vendor = map['vendor'];
}
