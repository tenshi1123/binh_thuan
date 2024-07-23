class ChiTietBuoiHocModel {
  final String libraryId;

  ChiTietBuoiHocModel({
    required this.libraryId,
  });
  factory ChiTietBuoiHocModel.fromJson(Map<String, dynamic> json) {
    return ChiTietBuoiHocModel(
      libraryId: (json['libraryId']),
    );
  }
}
