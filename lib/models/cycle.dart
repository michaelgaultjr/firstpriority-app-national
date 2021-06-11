class Cycle {
  final String id;
  final String name;

  Cycle.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'];
}
