class CoursesModel {
  int? id;
  String? courseName;
  String? pengajar;
  String? category;

  CoursesModel({this.id, this.courseName, this.pengajar, this.category});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    pengajar = json['pengajar'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['pengajar'] = this.pengajar;
    data['category'] = this.category;
    return data;
  }
}
