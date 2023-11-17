class Course {
  String? id;
  String? logo;
  String? name;

  Course({this.id, this.logo, this.name});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['code'];
    logo = json['logo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = id;
    data['logo'] = logo;
    data['name'] = name;
    return data;
  }
}
