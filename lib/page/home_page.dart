import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/component/bottom_sheet.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../component/helper.dart';
import '../hive/note_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with PrintClass {
  late Box noteBox;

  @override
  void initState() {
    noteBox = Hive.box("noteBox");
    super.initState();
  }

  @override
  void printData(String msg, data) {
    // TODO: implement printData
    super.printData(msg, data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text("Todo Task",
                style: TextStyle(fontSize: 40, color: Colors.blue)),
            Divider(thickness: 2, color: Colors.blue),
            Expanded(
              flex: 1,
              child: ValueListenableBuilder<Box>(
                valueListenable: noteBox.listenable(),
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      itemCount: noteBox.length,
                      itemBuilder: (context, index) {
                        NoteModel noteData = value.getAt(index);
                        return Slidable(
                          closeOnScroll: true,
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: noteData.status != false
                                    ? Colors.green
                                    : Colors.red,
                                radius: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(noteData.status != false
                                      ? Icons.check
                                      : Icons.cancel),
                                  color: Colors.white,
                                  onPressed: () {
                                    printData("status saat ini",noteData.status);
                                    if (noteData.status) {
                                      noteBox.putAt(
                                          index,
                                          NoteModel(
                                              judul: noteData.judul,
                                              desc: noteData.desc,
                                              status: false,
                                              tag: noteData.tag));
                                    } else {
                                      noteBox.putAt(
                                          index,
                                          NoteModel(
                                              judul: noteData.judul,
                                              desc: noteData.desc,
                                              status: true,
                                              tag: noteData.tag));
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.delete),
                                  color: Colors.white,
                                  onPressed: () {
                                    print(index);
                                    // noteBox.clear();
                                    noteBox.deleteAt(index);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: noteData.status == true
                                  ? Colors.blue
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      noteData.judul,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      noteData.desc,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                noteData.status == true
                                    ? Container()
                                    : Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.white,
                                      )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingActionButton());
  }
}
