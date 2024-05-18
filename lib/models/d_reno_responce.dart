class DRenoResponce {
  int id;
  int assureId;
  String numAssure;

  DRenoResponce({
    required this.id,
    required this.assureId,
    required this.numAssure,
  });

  factory DRenoResponce.fromJson(Map<String, dynamic> json) {
    return DRenoResponce(
      id: json['id'],
      assureId: json['assureId'],
      numAssure: json['numAssure'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assure_id'] = assureId;
    data['num_assure'] = numAssure;
    return data;
  }
}
