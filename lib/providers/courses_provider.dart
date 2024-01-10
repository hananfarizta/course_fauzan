import 'package:course_fauzan/models/courses_model.dart';
import 'package:course_fauzan/services/courses_service.dart';
import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier {
  List<CoursesModel> _courseses = [];
  List<CoursesModel> get courseses => _courseses;
  set courseses(List<CoursesModel> courseses) {
    _courseses = courseses;
    notifyListeners();
  }

  Future<List<CoursesModel>> getCourses() async {
    try {
      List<CoursesModel>? courseses = await CoursesService().getCourses();
      _courseses = courseses;
      return courseses;
    } catch (e) {
      print(e);
      var coursesModel = CoursesModel();
      List<CoursesModel> model = [coursesModel];
      return model;
    }
  }
}

class DetailProvider with ChangeNotifier {
  DetailModel? _detail;
  DetailModel? get detail => _detail;
  set detail(DetailModel? detail) {
    _detail = detail;
    notifyListeners();
  }

  Future<DetailModel> getDetail(String? id) async {
    try {
      DetailModel? detail = await DetailService().showDetail(id);
      _detail = detail;
      return detail;
    } catch (e) {
      print(e);
      return DetailModel();
    }
  }
}
