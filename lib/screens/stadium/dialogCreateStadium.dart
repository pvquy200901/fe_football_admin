import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../api/api.dart';
import 'map.dart';

class EditInfoDialog extends StatefulWidget {
  final String name;
  final String address;
  final String contact;
  final int price;
  final String latitude;
  final String longtitude;

  EditInfoDialog(
      {required this.name,
      required this.address,
      required this.contact,
      required this.price,
      required this.latitude,
      required this.longtitude});

  @override
  _EditInfoDialogState createState() => _EditInfoDialogState();
}

class _EditInfoDialogState extends State<EditInfoDialog> {
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _priceController = TextEditingController();
  String _latitude = "";
  String _longtitude ="";
  LatLng? pickedLocation;

  @override
  void initState() {
    super.initState();
    _addressController.text = widget.address;
    _contactController.text = widget.contact;
    _priceController.text = widget.price.toString();
    _latitude = widget.latitude;
    _longtitude = widget.longtitude;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //contentPadding: EdgeInsets.all(50),
      title: Text(widget.name),
        content: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Stack(
                    children: [
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Địa chỉ',
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MapPickerWidget()),
                              );
                              setState(() {
                                pickedLocation = result;
                              });

                            },
                            icon: const Icon(Icons.add_location_alt_outlined),
                            color: Colors.cyan,
                          ))
                    ],
                  )),
            ],
          ),
          TextFormField(
            controller: _contactController,
            decoration: InputDecoration(
              labelText: 'Liên hệ',
            ),
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(
              labelText: 'Giá',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Hủy bỏ'),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Loading...'),
                  );
                });
            var data = {
              "name": widget.name,
              "address": _addressController.text,
              "contact": _contactController.text,
              "price": int.parse(_priceController.text),
              "latitude": pickedLocation!.latitude.toString(),
              "longtitude": pickedLocation!.longitude.toString(),
            };
            api
                .editStadium(data)
                .then((value) {
              if (value) {
                Future.delayed(const Duration(seconds: 0))
                    .then((value) async {
                  Get.offAllNamed('/listStadium');
                });
              } else {
              }
            });
          },
          child: Text('Lưu'),
        ),
      ],
    );
  }
}
