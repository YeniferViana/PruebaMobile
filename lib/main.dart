import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: cadastrotarefas()),
  );
}

class cadastrotarefas extends StatefulWidget {
  @override
  State<cadastrotarefas> createState() => _cadastrotarefas();
}

class _cadastrotarefas extends State<cadastrotarefas> {
  final List<String> items = [];
  final tarefa = TextEditingController();

  void agregarItem() {
    if (tarefa.text.isNotEmpty) {
      setState(() {
        items.add({'tarefa': tarefa.text} as String);
        tarefa.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas", style: TextStyle(color: Colors.blue)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: tarefa,
              decoration: InputDecoration(
                labelText: 'Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(onPressed: agregarItem, child: Text("Agregar")),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(items[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
