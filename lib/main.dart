
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // Controller for reading input
  final TextEditingController _controller =
      TextEditingController();

  // Stores the printed text
  String outputText = '';

  // Print button function
  void printText() {
    setState(() {
      outputText = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Example'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Input field
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter something',
                hintText: 'Type your text here',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Print button
            ElevatedButton(
              onPressed: printText,
              child: const Text('Print'),
            ),

            const SizedBox(height: 25),

            // Output text
            Text(
              outputText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
