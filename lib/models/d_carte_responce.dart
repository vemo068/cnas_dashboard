class DCarteResponce {
  int id;
  int assureId;
  String numAssure;

  DCarteResponce({
    required this.id,
    required this.assureId,
    required this.numAssure,
  });

  factory DCarteResponce.fromJson(Map<String, dynamic> json) {
    return DCarteResponce(
      id: json['id'],
      assureId: json['assure_id'],
      numAssure: json['num_assure'],
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
