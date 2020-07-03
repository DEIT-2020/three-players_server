import 'dart:html';

class Experiment {
  final int id;
  String name;
  String process;
  //ImageElement image;

  Experiment(this.id, this.name, this.process);
  factory Experiment.fromJson(Map<String, dynamic> experiment) => Experiment(
      _toInt(experiment['id']), experiment['name'], experiment['process']);

  Map toJson() => {'id': id, 'name': name, 'process': process};
}

int _toInt(id) => id is int ? id : int.parse(id);
