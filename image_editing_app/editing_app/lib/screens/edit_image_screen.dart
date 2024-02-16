import 'dart:io';

import 'package:editing_app/widgets/edit_image_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({
    Key? key,
    required this.selectedImage,
  }) : super(key: key);
  final String selectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Screenshot(
        
        controller: screenshotController,
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: Stack(
              children: [
                _selectedImage,
                for (int i = 0; i < texts.length; i++)
                  Positioned(
                    left: texts[i].left,
                    top: texts[i].top,
                    child: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          currentIndex = i;
                          removeText(context);
                        });
                      },
                      onTap: () => setCurrentIndex(context, i),
                      child: Draggable(
                        feedback: ImageText(
                          texInfo: texts[i],
                        ),
                        child: ImageText(
                          texInfo: texts[i],
                        ),
                        onDragEnd: (drag) {
                          final renderBox =
                              context.findRenderObject() as RenderBox;
                          Offset off = renderBox.globalToLocal(drag.offset);
                          setState(() {
                            texts[i].top = off.dy - 96;
                            texts[i].left = off.dx;
                          });
                        },
                      ),
                    ),
                  ),
                creatorText.text.isNotEmpty
                    ? Positioned(
                        left: 0,
                        bottom: 0,
                        child: Text(creatorText.text,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.3))))
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _addnewTextFab,
    );
  }

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed:()=> saveToGallery(context),
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                tooltip: "Save Image",
              ),
              IconButton(
                onPressed: increaseFontSize,
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                tooltip: "Increase font size",
              ),
              IconButton(
                onPressed: decreaseFontSize,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                tooltip: "Decrease font size",
              ),
              IconButton(
                onPressed: alignTextLeft,
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                tooltip: "Align Left",
              ),
              IconButton(
                onPressed: alignTextCenter,
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                ),
                tooltip: "Align Center",
              ),
              IconButton(
                onPressed: alignTextRight,
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                ),
                tooltip: "Align Right",
              ),
              IconButton(
                onPressed: boldText,
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                tooltip: "Bold",
              ),
              IconButton(
                onPressed: italicText,
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                tooltip: "Italic",
              ),
              IconButton(
                onPressed: addLineToText,
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                tooltip: "Add New Line",
              ),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.red),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.white),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.black),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.blue),
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.yellow),
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.green),
                    child: const CircleAvatar(
                      backgroundColor: Colors.green,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Orange',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.orange),
                    child: const CircleAvatar(
                      backgroundColor: Colors.orange,
                    )),
              ),
              const SizedBox(width: 5),
              Tooltip(
                message: 'Pink',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.pink),
                    child: const CircleAvatar(
                      backgroundColor: Colors.pink,
                    )),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      );

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.sizeOf(context).width,
        ),
      );

  Widget get _addnewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(Icons.edit, color: Colors.black),
      );
}
