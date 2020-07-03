class Note {
  final int id;
    String content;

    Note(this.id,this.content);

 factory Note.fromJson(Map<String, dynamic> note) =>
      Note(_toInt(note['id']), note['content']);
  Map toJson() => {'id': id, 'content': content};
}
int _toInt(id) => id is int ? id : int.parse(id);
