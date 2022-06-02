import '../model/job.dart';

class JobService {
  late List<Job> jobs = [];

  JobService() {
    Job job = Job();
    job.id = 1;
    job.name = "waa spa";
    job.imageUrl =
    "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.subName = "สวิตเซอร์แลด์";
    job.price = "49000";
    jobs.add(job);

    job = Job();
    job.id = 2;
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.imageUrl =
    "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";

    jobs.add(job);

    job = Job();
    job.id = 3;
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.imageUrl =
    "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.price = "32000";

    jobs.add(job);

    job = Job();
    job.id = 4;
    job.imageUrl =
    "https://thebest-edu.com/wp-content/uploads/2020/11/Switzerland-Scenery.jpeg";
    job.name = "paaaaaa spa";
    job.subName = "อิตาลี";
    job.price = "32000";

    jobs.add(job);
  }

  List<Job> getListJob() {
    return jobs;
  }

  Job getById(int id) {
    return jobs.firstWhere((element) => element.id == id);
  }
}