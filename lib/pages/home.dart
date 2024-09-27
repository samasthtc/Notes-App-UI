import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/pages/add_edit_note.dart';
import 'package:notes/theme/colors.dart';
import 'package:notes/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];

  @override
  void initState() {
    //comment out the following lines to view the empty state
    notes = [
      Note(
        id: 1,
        title: 'Note 1',
        description: 'Description 1',
      ),
      Note(
        id: 2,
        title: 'Note 2',
        description: 'Description 2',
      ),
      Note(
        id: 3,
        title: 'Note 3',
        description: 'Description 3',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 68,
            elevation: 8,
            pinned: true,
            backgroundColor: primaryColor,
            shadowColor: primaryColor,
            surfaceTintColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 0),
              title: CustomAppBar(
                title: "Notes",
                trailingBtnIcon: Icons.search,
                color: inversePrimaryColor,
                trailingBtnOnPressed: () {},
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
            sliver: notes.isEmpty
                ? SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/empty_bg.png'),
                          const SizedBox(height: 16),
                          const Text(
                            'Create your first note!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return noteCard(
                          notes[index % notes.length],
                          noteColors[index % noteColors.length],
                        );
                      },
                      childCount: notes.length * 5,
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff3b3b3b),
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditNotePage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: inversePrimaryColor,
        ),
      ),
    );
  }

  Widget noteCard(Note note, Color color) {
    return Card(
      color: color,
      elevation: 6,
      shadowColor: color.withOpacity(1),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Text(note.title),
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 24,
        ),
        subtitle: Text(
          note.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
