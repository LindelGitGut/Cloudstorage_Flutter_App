class FileModel {
  int fileId;
  String filename;
  String contentType;
  String fileSize;

  FileModel({
    required this.fileId,
    required this.filename,
    required this.contentType,
    required this.fileSize,
  });

  // Erzeugt eine Instanz von FileModel aus einem JSON-Objekt
  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      fileId: json['fileId'],
      filename: json['filename'],
      contentType: json['contentType'],
      fileSize: json['fileSize'],
    );
  }

  // Konvertiert eine Instanz von FileModel in ein JSON-Objekt
  Map<String, dynamic> toJson() {
    return {
      'fileId': fileId,
      'filename': filename,
      'contentType': contentType,
      'fileSize': fileSize,
    };
  }
}