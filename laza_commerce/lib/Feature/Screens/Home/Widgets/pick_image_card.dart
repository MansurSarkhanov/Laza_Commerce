import 'package:flutter/material.dart';

import '../../../../Core/Service/firebase_storage_service.dart';
import '../../../Animations/bounce_animation.dart';
import '../../../Components/Painter/dash_painter.dart';

class PickImageCard extends StatefulWidget {
  const PickImageCard({super.key, required this.storage});
  final FirebaseStorageService storage;

  @override
  State<PickImageCard> createState() => _PickImageCardState();
}

class _PickImageCardState extends State<PickImageCard> {
  @override
  Widget build(BuildContext context) {
    return BounceFromBottomAnimation(
      delay: 4,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).hoverColor),
          child: widget.storage.selectedFile != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(
                                widget.storage.selectedImgeByte!,
                              )),
                          color: const Color.fromARGB(255, 223, 223, 225),
                        ),
                      ),
                      TextButton(
                        child: const Text('Change Photo'),
                        onPressed: () async {
                          await widget.storage.pickImage();
                          setState(() {});
                        },
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () async {
                      await widget.storage.pickImage();
                      setState(() {});
                    },
                    child: Card(
                      child: CustomPaint(
                        painter: DashedBorderPainter(),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20.0), // İstediğiniz kenar yuvarlaklığını ayarlayabilirsiniz.
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 32,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
