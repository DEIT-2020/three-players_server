import 'dart:html';

class Experiment {
  final int id;
  String name;
  String process;
  String tip;
  //ImageElement image;

  Experiment(this.id, this.name, this.process,this.tip);
 factory Experiment.fromJson(Map<String, dynamic> experiment) => Experiment(
      _toInt(experiment['id']), experiment['name'], experiment['process'],experiment['tip']);

  Map toJson() => {'id': id, 'name': name, 'process': process,'tip':tip};
}

int _toInt(id) => id is int ? id : int.parse(id); 
