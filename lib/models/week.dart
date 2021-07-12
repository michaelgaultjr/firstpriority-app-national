class Week {
  final String id;
  final String name;
  final int order;

  Week.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        order = map['order'];

  bool operator ==(dynamic other) =>
      other != null && other is Week && this.id == other.id;

  @override
  int get hashCode => super.hashCode;
}
