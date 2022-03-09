// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHeader(),
              Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                child: SearchTabs(),
              ),
              Divider(
                height: 0,
                thickness: 0.3,
              ),
              FutureBuilder(
                future: ApiService().fetchData(
                  context: context,
                  queryTerm: searchQuery,
                  start: start,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: size.width <= 768 ? 10 : 150,
                            top: 12,
                          ),
                          child: Text(
                            'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results  (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?['items'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150, top: 10),
                              child: SearchResultComponent(
                                linkToGo: snapshot.data?['items'][index]
                                    ['link'],
                                link: snapshot.data?['items'][index]
                                    ['formattedUrl'],
                                text: snapshot.data?['items'][index]['title'],
                                desc: snapshot.data?['items'][index]['snippet'],
                              ),
                            );
                          },
                        ),
                        // pagination btns
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: start != "0"
                                    ? () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                      searchQuery: searchQuery,
                                                      start: (int.parse(start) -
                                                              10)
                                                          .toString(),
                                                    )));
                                      }
                                    : () {},
                                child: Text(
                                  '< Prev',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,
                                        start:
                                            (int.parse(start) + 10).toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Next >',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        SearchFooter(),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
