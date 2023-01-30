import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  State<DataFromAPI> createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  var _postJson = [];

  void fetchProperties() async {
    final response =
        await get(Uri.parse('https://arasaka.onrender.com/properties'));
    final jsonData = jsonDecode(response.body) as List;

    setState(() {
      _postJson = jsonData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: _postJson.length,
    //     itemBuilder: (context, index){
    //       final property  = _postJson[index];
    //       return Text("${property['property_name']}",style:GoogleFonts.poppins( textStyle: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),),);
    //     });
    return ListView.builder(itemBuilder: (context, index) {
      final property = _postJson[index];
      return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(5),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network('${property['image']}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Text(
                    '${property['property_name']}',
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${property['property_description']}',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
