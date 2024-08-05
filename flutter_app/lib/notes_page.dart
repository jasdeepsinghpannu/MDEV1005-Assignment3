import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> _notes = [];
  final TextEditingController _controller = TextEditingController();

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _notes.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  Widget _customButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.purple, // AppBar background color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.purple[50], // Background color for the input area
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter a note',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.note_add, color: Colors.purple),
                ),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20),
            _customButton('Add Note', _addNote),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        _notes[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                      trailing: GestureDetector(
                        onTap: () => _deleteNote(index),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
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
