import 'dart:convert';
import 'dart:core';
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
  // this function is called when the app launches
  Future<List> _loadData() async {
    final List<Job> jobEntries = [];
    try {
      final String json =
          await rootBundle.loadString('assets/data/job_history.json');
      final data = await jsonDecode(json)["history"] as List;
      jobEntries.addAll(data.map((job) => Job.fromJson(job)));
    } catch (err) {
      // ignore: avoid_print
      print(err);
    }
    return jobEntries;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: _paddingX(context),
                            vertical: _paddingY(context),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              resumeHeader(context, widget.profileInfo),
                              for (var job in snapshot.data!)
                                ResumeEntries(job: job)
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
  }
}

double _paddingX(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.width * .063;
  } else {
    return MediaQuery.of(context).size.width * .04;
  }
}

double _paddingY(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.of(context).size.height * .03;
  } else {
    return MediaQuery.of(context).size.height * .02;
  }
}
