class CycleResource {
  final String cycleId;
  final String weekId;
  final String videoLink;
  final String pdfUrl;

  CycleResource.fromMap(Map<String, dynamic> map)
      : cycleId = map["cycleId"],
        weekId = map["weekId"],
        videoLink = map["videoLink"],
        pdfUrl = map["pdfUrl"];
}
