import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/study_controller.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studyController = Provider.of<StudyController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Study'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Add subject'),
              onChanged: (value) {
                studyController.newSubject = value;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (studyController.newSubject != null &&
                    studyController.newSubject!.isNotEmpty) {
                  studyController.addStudy(Study(
                    subject: studyController.newSubject!,
                    isDone: false,
                  ));
                  studyController.newSubject = null;
                }
              },
              child: const Text('Add subject'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: studyController.studies.length,
                itemBuilder: (context, index) {
                  final study = studyController.studies[index];
                  return ListTile(
                    title: Text(study.subject),
                    trailing: Checkbox(
                      value: study.isDone,
                      onChanged: (value) {
                        studyController.toggleDone(study);
                      },
                    ),
                    onTap: () {
                      studyController.updateStudy(Study(
                        subject: study.subject,
                        isDone: !study.isDone,
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}