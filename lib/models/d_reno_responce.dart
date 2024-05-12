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
      assureId: json['assure_id'],
      numAssure: json['num_assure'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assure_id'] = this.assureId;
    data['num_assure'] = this.numAssure;
    return data;
  }
}
