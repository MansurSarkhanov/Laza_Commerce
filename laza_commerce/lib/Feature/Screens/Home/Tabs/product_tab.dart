import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';

import '../../../../Core/Models/category_model.dart';
import '../../../../Core/Service/firebase_storage_service.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.state});
  final HomeSuccess state;
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final storage = FirebaseStorageService();

  @override
  Widget build(BuildContext context) {
    String? chosenModel = widget.state.categoryList.first.name;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: const Padding(padding: EdgeInsets.all(16), child: Icon(Icons.arrow_back)),
                ),
              ),
              const Spacer(),
              const Text(
                "Add Product",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Select Category",
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey))),
                value: chosenModel,
                items: widget.state.categoryList.map<DropdownMenuItem<String>>((CategoryModel value) {
                  return DropdownMenuItem<String>(
                    value: value.name,
                    child: Text(
                      value.name ?? 'Test',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    chosenModel = newValue;
                  });
                },
                hint: const Text(
                  "Choose a Car Model",
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).hoverColor),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      onTap: () async {
                        await storage.pickImage();

                        setState(() {});
                      },
                      child: storage.selectedFile != null
                          ? Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                      storage.selectedImgeByte!,
                                    )),
                                color: const Color.fromARGB(255, 223, 223, 225),
                              ),
                            )
                          : Card(
                              child: CustomPaint(
                                painter: DashedBorderPainter(),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // İstediğiniz kenar yuvarlaklığını ayarlayabilirsiniz.
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
                            )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text("Start Date"),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                              context: context,
                              firstDate: DateTime(2017, 9, 7, 17, 30),
                              lastDate: DateTime(2023, 9, 7, 17, 30));
                        },
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.green),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [Text("Today"), Icon(Icons.date_range)],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 6.0;
    const double dashSpace = 6.0;

    // Sol kenar
    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Sağ kenar
    double endY = 0.0;
    while (endY < size.height) {
      canvas.drawLine(Offset(size.width, endY), Offset(size.width, endY + dashWidth), paint);
      endY += dashWidth + dashSpace;
    }

    // Üst kenar
    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Alt kenar
    double endX = 0.0;
    while (endX < size.width) {
      canvas.drawLine(Offset(endX, size.height), Offset(endX + dashWidth, size.height), paint);
      endX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
