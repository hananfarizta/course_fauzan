import 'dart:convert';

import 'package:course_fauzan/models/courses_model.dart';
import 'package:http/http.dart' as http;

class CoursesService {
  Future<List<CoursesModel>> getCourses() async {
    var url = 'http://si-sdm.id/ecourse/api/web/v1/courses/all';

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['items'];
      List<CoursesModel> courseses = [];

      for (var item in data) {
        courseses.add(CoursesModel.fromJson(item));
      }
      return courseses;
    } else {
      throw Exception('Gagal Get Courses!');
    }
  }
}

class DetailService {
  Future<DetailModel> showDetail(String? id) async {
    var url = 'http://si-sdm.id/ecourse/api/web/v1/courses/get-item?id=$id';

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DetailModel detail = DetailModel.fromJson(data);
      return detail;
    } else {
      throw Exception('Failed To Get Data!');
    }
  }
}
