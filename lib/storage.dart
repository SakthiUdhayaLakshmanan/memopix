import 'package:flutter/material.dart';

class Update {
  final String title;
  final DateTime date;

  Update({required this.title, required this.date});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Updates List',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: UpdateListPage(),
    );
  }
}

class UpdateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample updates data
    List<Update> updates = [
      Update(title: "ooty", date: DateTime.parse("2024-10-01")),
      Update(title: "Thailand", date: DateTime.parse("2023-09-03")),
      Update(title: "Delhi", date: DateTime.parse("2023-07-27")),
      Update(title: "malaysia", date: DateTime.parse("2023-02-28")), // corrected the date
      Update(title: "Bengaluru", date: DateTime.parse("2022-12-17")),
      Update(title: "varkala", date: DateTime.parse("2021-07-09")),
    ];

    // Sort updates by date
    updates.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
        backgroundColor: Colors.pink, // Set AppBar color to pink
      ),
      body: ListView.builder(
        itemCount: updates.length,
        itemBuilder: (context, index) {
          final update = updates[index];
          return ListTile(
            title: Text(update.title),
            subtitle: Text("${update.date.toLocal()}".split(' ')[0]), // Format date as needed
          );
        },
      ),
    );
  }
}
