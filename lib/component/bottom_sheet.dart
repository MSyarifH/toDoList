import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/hive/note_model.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({super.key});

  final TextEditingController _judul = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _tag = TextEditingController();

  saveStudent({
    required String judul,
    required String desc,
    required String tag,
  }) async {
    Box box = await Hive.openBox('noteBox');
    box.add(NoteModel(judul: judul, desc: desc, status: true, tag: tag));
    _judul.text = "";
    _desc.text = "";
    _tag.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25.0))),
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 15,
                      right: 15,
                      top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _judul,
                          decoration: const InputDecoration(
                            labelText: 'judul',
                            border: OutlineInputBorder(),
                          ),
                          autofocus: true,
                          // controller: _newMediaLinkAddressController,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: _desc,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'deskripsi',
                            border: OutlineInputBorder(),
                          ),
                          autofocus: true,
                          // controller: _newMediaLinkAddressController,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _tag,
                          decoration: const InputDecoration(
                            labelText: 'tag',
                            border: OutlineInputBorder(),
                          ),
                          autofocus: true,
                          // controller: _newMediaLinkAddressController,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            saveStudent(
                                judul: _judul.text,
                                desc: _desc.text,
                                tag: _tag.text);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Simpan"),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ));
      },
      child: const Icon(Icons.add),
    );
  }
}
