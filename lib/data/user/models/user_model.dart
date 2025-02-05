class UserModel {
  final String? email;
  final String? name;
  final String? surname;
  final bool? active;
  final String? note;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.email,
    required this.name,
    required this.surname,
    required this.active,
    this.note,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      active: json['active'],
      note: json['note'],
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'surname': surname,
      'active': active,
      'note': note,
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
