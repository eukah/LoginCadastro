import 'package:flutter/material.dart';

class Study {
  final String subject;
  bool isDone;

  Study({required this.subject, this.isDone = false});
}

class StudyController extends ChangeNotifier {
  String? _newSubject;

  set newSubject(String? value) {
    _newSubject = value;
    notifyListeners();
  }

  String? get newSubject => _newSubject;
  final List<Study> _studies = [];

  List<Study> get studies => _studies;

  void addStudy(Study study) {
    _studies.add(study);
    notifyListeners();
  }

  void updateStudy(Study study) {
    final index = _studies.indexWhere((s) => s.subject == study.subject);
    if (index != -1) {
      _studies[index] = study;
      notifyListeners();
    }
  }

  void deleteStudy(Study study) {
    _studies.removeWhere((s) => s.subject == study.subject);
    notifyListeners();
  }

  void toggleDone(Study study) {
    final index = _studies.indexWhere((s) => s.subject == study.subject);
    if (index != -1) {
      _studies[index].isDone = !_studies[index].isDone;
      notifyListeners();
    }
  }
}


