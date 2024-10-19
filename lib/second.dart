import 'package:flutter/material.dart';
import 'storage.dart';

void main() {
  runApp(SecondWidget());
}

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          appBar: AppBar(
            title: Text('memopix'),
            backgroundColor: Colors.pink,
            automaticallyImplyLeading: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('Menu icon pressed');
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Search icon pressed');
                },
              ),
              IconButton(
                icon: Icon(Icons.note),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                  print('Note icon pressed');
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThoughtsSection(),
                    SizedBox(height: 24),
                    buildCaptureDaySection(),
                    SizedBox(height: 24),
                    buildMoodTrackerSection(),
                    SizedBox(height: 24),
                    buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildThoughtsSection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Today's Thoughts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF14181B),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: textController,
                focusNode: textFieldFocusNode,
                minLines: 4,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Share your reflections for the day...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCaptureDaySection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Capture Your Day',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF14181B),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate,
                      color: Color(0xFF677681),
                      size: 48,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tap to add an image',
                      style: TextStyle(color: Color(0xFF677681)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMoodTrackerSection() {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Mood Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF14181B),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMoodIcon(
                      Icons.sentiment_very_satisfied, 'Happy', Colors.yellow),
                  buildMoodIcon(Icons.sentiment_satisfied, 'Good', Colors.green),
                  buildMoodIcon(Icons.sentiment_neutral, 'Okay', Colors.blue),
                  buildMoodIcon(
                      Icons.sentiment_dissatisfied, 'Sad', Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMoodIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(icon, color: Colors.white, size: 36),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Color(0xFF14181B))),
      ],
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        print('Save Today\'s Entry button pressed ...');
      },
      child: Text('Save Today\'s Entry'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        minimumSize: Size(double.infinity, 56),
      ),
    );
  }
}
