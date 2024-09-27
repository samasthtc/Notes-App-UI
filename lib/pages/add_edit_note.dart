import 'package:flutter/material.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/widgets/custom_app_bar.dart';

class AddEditNotePage extends StatefulWidget {
  const AddEditNotePage({super.key});

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;

  @override
  void initState() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          children: [
            CustomAppBar(
              isPushed: true,
              trailingBtnIcon: Icons.save,
              color: inversePrimaryColor,
              trailingBtnOnPressed: () {},
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 48,
                  color: secondaryColor,
                ),
              ),
              style: TextStyle(
                fontSize: 48,
                color: inversePrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Type something...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 24,
                    color: secondaryColor,
                  ),
                ),
                style: TextStyle(
                  fontSize: 24,
                  color: inversePrimaryColor,
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
