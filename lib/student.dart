class Student {
  final int id;
  final String name;
  final String division;

  Student({
    required this.id,
    required this.name,
    required this.division,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'division': division,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      division: json['division'],
    );
  }
}
