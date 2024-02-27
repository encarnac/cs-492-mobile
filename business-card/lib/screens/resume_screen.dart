import 'dart:core';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../components/resume_components.dart';
import '../models/job.dart';

class ResumeScreen extends StatefulWidget {
  final Map profileInfo;
  const ResumeScreen({Key? key, required this.profileInfo}) : super(key: key);

  @override
  State<ResumeScreen> createState() {
    return ResumeState();
  }
}

class ResumeState extends State<ResumeScreen> {
  // Reads data from JSON on start-up
  Future<List> _loadData() async {
    final List<Job> jobEntries = [];
    try {
      final String json =
          await rootBundle.loadString('assets/data/job_history.json');
      final data = await jsonDecode(json)["history"] as List;
      jobEntries.addAll(data.map((job) => Job.fromJson(job)));
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return jobEntries;
  }

  @override
  Widget build(BuildContext context) {
    // Determines whether to render job data or loading image
    return FutureBuilder(
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? resumeLayout(context, snapshot, widget.profileInfo)
                : const Center(child: CircularProgressIndicator()));
  }
}
