class Cycle {
  final String id;
  final String name;

  Cycle.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'];

  bool operator ==(dynamic other) =>
      other != null && other is Cycle && this.id == other.id;

  @override
  int get hashCode => super.hashCode;
}
