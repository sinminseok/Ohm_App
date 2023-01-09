
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomSearchPage extends SearchDelegate{

  List<String> searchTerms = [
    'apple',
    'banna',
    'pear',
    'Watermelons'
  ];

  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.keyboard_arrow_left));
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },);
  }

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },);

  }

}