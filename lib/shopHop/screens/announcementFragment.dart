import 'package:flutter/material.dart';

class AnnouncementFragment extends StatefulWidget {
  const AnnouncementFragment({Key? key}) : super(key: key);

  @override
  _AnnouncementFragmentState createState() => _AnnouncementFragmentState();
}

class _AnnouncementFragmentState extends State<AnnouncementFragment> {


  @override
  Widget build(BuildContext context) {
    return  Container(child: Center(child: Text("Announcement Coming Soon", style: TextStyle(fontWeight: FontWeight.w900),)));
  }
}
