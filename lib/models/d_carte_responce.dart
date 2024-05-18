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

List<DCarteResponce> responseDCartesList = [
    DCarteResponce(id: 1, assureId: 101, numAssure: '12345'),
    DCarteResponce(id: 2, assureId: 102, numAssure: '23456'),
    DCarteResponce(id: 3, assureId: 103, numAssure: '34567'),
    DCarteResponce(id: 4, assureId: 104, numAssure: '45678'),
    DCarteResponce(id: 5, assureId: 105, numAssure: '56789'),
    DCarteResponce(id: 6, assureId: 106, numAssure: '67890'),
    DCarteResponce(id: 7, assureId: 107, numAssure: '78901'),
    DCarteResponce(id: 8, assureId: 108, numAssure: '89012'),
    DCarteResponce(id: 9, assureId: 109, numAssure: '90123'),
    DCarteResponce(id: 10, assureId: 110, numAssure: '01234'),
  ];