import 'dart:html';

class Tool {
  final int id;
  String name;
  String function;
  //ImageElement image;
  var link;
  Tool(this.id, this.name, this.function, this.link);
  factory Tool.fromJson(Map<String, dynamic> tool) =>
      Tool(_toInt(tool['id']), tool['name'], tool['function'], tool['link']);
  Map toJson() => {'id': id, 'name': name, 'function': function, 'link': link};
}

int _toInt(id) => id is int ? id : int.parse(id);
