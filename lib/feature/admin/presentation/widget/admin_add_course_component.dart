import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Description',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _ratingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Rating',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _mentorNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Mentor Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _imageUrlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Image Url',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Category',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _levelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Level',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Course Price',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _videoUrlController,
                    decoration: InputDecoration(
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
                          await state.addCourse(
                            id: 'id',
                            name: _nameController.text,
                            rating: _ratingController.text,
                            description: _descriptionController.text,
                            imageUrl: _imageUrlController.text,
                            category: _categoryController.text,
                            level: _levelController.text,
                            price: _priceController.text,
                            videoUrl: _videoUrlController.text,
                            createAt: TimeOfDay.now().toString(),
                            updateAt: TimeOfDay.now().toString(),
                            mentorName: _mentorNameController.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Course Added"),
                            ),
                          );
                          _nameController.clear();
                          _ratingController.clear();
                          _descriptionController.clear();
                          _imageUrlController.clear();
                          _categoryController.clear();
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
                      child: Text('Add Course'),
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
