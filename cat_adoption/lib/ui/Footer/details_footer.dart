import 'package:cat_adoption/cat.dart';
import 'package:cat_adoption/ui/Footer/CattributsShowCase.dart';
import 'package:cat_adoption/ui/Footer/DetailsShowCase.dart';
import 'package:cat_adoption/ui/Footer/PictureShowCase.dart';
import 'package:flutter/material.dart';

class CatShowCase extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  const CatShowCase({Key key, this.cat, this.avatarTag}) : super(key: key);


  @override
  _CatShowCaseState createState() => _CatShowCaseState();
}

class _CatShowCaseState extends State<CatShowCase> with TickerProviderStateMixin {

  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      new Tab(text: 'Picture',),
      new Tab(text: 'Details',),
      new Tab(text: 'Cattributes',)
    ];

    _pages = [
      new PictureShowCase(widget.cat),
      new DetailsShowCase(widget.cat),
      new CattributesShowCase(widget.cat)
    ];
    
    _controller = new TabController(length: _tabs.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        TabBar(controller: _controller,
        tabs: _tabs,
          indicatorColor: Colors.white,
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(300.0),
          child: new TabBarView(children: _pages,
          controller: _controller,),
        ),

      ],
    ),
    );
  }
}
