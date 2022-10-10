import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slide1/contact/info.dart';
import 'package:slide1/contact/nomor.dart';

class listNumber extends StatefulWidget {
  const listNumber ({Key key}) : super(key: key);
  @override
  _listNumberState  createState() => _listNumberState();
}

class _listNumberState extends State<listNumber>{
  List<nomor> _nomorList = nomorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Call Center Departement'),
        backgroundColor: Colors.orangeAccent,
        // elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Geser untuk menelepon"),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _nomorList.length,
                itemBuilder: (context, index) {
                  nomor c = _nomorList[index];
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      tileColor:
                      (c.isFavorite) ? Colors.blue.shade100 : Colors.white,
                      leading: Icon(Icons.person),
                      title: Text("${c.name}"),
                      subtitle: Text("${c.number}"),
                    ),
                    actions: [
                      IconSlideAction(
                        caption: 'info',
                        color: Colors.blue,
                        icon: Icons.info,
                        onTap: () {
                          setState(() {
                            info(context);
                          });
                        },
                      ),
                      IconSlideAction(
                        caption: 'Phone',
                        color: Colors.green,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            FlutterPhoneDirectCaller.callNumber("${c.number}");
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}