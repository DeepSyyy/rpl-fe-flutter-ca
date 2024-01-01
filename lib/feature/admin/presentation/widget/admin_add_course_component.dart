import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/key_points_widget.dart';
import 'package:provider/provider.dart';

List<String> kategori = [
  "UI/UX Designer",
  "Frontend Developer",
  "Backend Developer",
  "Mobile Developer",
  "Data Scientist",
  "Data Analyst",
  "Product Manager",
  "Project Manager",
  "Business Analyst",
  "Digital Marketing",
  "Content Creator",
];

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _mentorNameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();
  String _categoryController = kategori[0];
  List<String> keyPoints = [];

  void _showDialog() {
    TextEditingController keyPointController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Key Point'),
          content: TextField(
            controller: keyPointController,
            decoration: const InputDecoration(hintText: "Key Point"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                keyPoints.add(keyPointController.text);
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            _showDialog();
          },
          child: const SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.add),
                Text('Add Key Point'),
              ],
            ),
          )),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Add Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Description',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _ratingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Rating',
                    ),
                  ),
                ),
                KeyPointsWidget(
                    counter: keyPoints.length, keyPoints: keyPoints),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _mentorNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Mentor Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _imageUrlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Image Url',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Category',
                    ),
                    value: _categoryController,
                    onChanged: (String? newValue) {
                      setState(() {
                        _categoryController = newValue!;
                      });
                    },
                    items: kategori.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _levelController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Level',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Price',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _videoUrlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Video Url',
                    ),
                  ),
                ),
                Consumer<AdminCourseProvider>(builder: (context, state, _) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          state.addCourse(
                            name: _nameController.text,
                            rating: _ratingController.text,
                            description: _descriptionController.text,
                            imageUrl: _imageUrlController.text,
                            category: _categoryController,
                            level: _levelController.text,
                            price: _priceController.text,
                            videoUrl: _videoUrlController.text,
                            keyPoints: keyPoints,
                            createAt: DateTime.now().toString(),
                            updateAt: DateTime.now().toString(),
                            mentorName: _mentorNameController.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Course Added"),
                            ),
                          );
                          _nameController.clear();
                          _ratingController.clear();
                          _descriptionController.clear();
                          _imageUrlController.clear();
                          _levelController.clear();
                          _priceController.clear();
                          _videoUrlController.clear();
                          _mentorNameController.clear();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      },
                      child: const Text('Add Course'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
