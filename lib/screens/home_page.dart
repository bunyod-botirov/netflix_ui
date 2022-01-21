import 'package:flutter/material.dart';
import 'dart:math';
import './info_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _categories = <String>[
    "DISCOVER",
    "CATEGORIES",
    "CARTONS",
    "SERIALS",
    "SHOWS",
    "ACTIONS"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Image.asset(
          "assets/netflixlogo.png",
          height: 70,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2.07,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: (MediaQuery.of(context).size.height * 0.3).toInt(),
                child: topPictures(context),
              ),
              Expanded(
                flex: (MediaQuery.of(context).size.height * 0.15).toInt(),
                child: middleCategories(),
              ),
              Expanded(
                flex: (MediaQuery.of(context).size.height * 1.80).toInt(),
                child: bottomMovies(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView topPictures(context) {
    return ListView.builder(
      controller: ScrollController(
        initialScrollOffset: MediaQuery.of(context).size.width * 0.75,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: FadeInImage.assetNetwork(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                  placeholder: "assets/loader.gif",
                  image: "https://source.unsplash.com/random/$index",
                ),
              ),
            ),
            const Positioned(
              bottom: 30.0,
              left: 30.0,
              child: Text(
                "THE NUTCRACKER\nAND THE FOUR REALMS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Padding middleCategories() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 15, 0),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Text(
                _categories[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.color),
                image: NetworkImage(
                  "https://source.unsplash.com/random/${index + Random().nextInt(50)}",
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding bottomMovies(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          listTile("My List"),
          movies(context),
          listTile("Popular on Netflix"),
          movies(context),
          listTile("New Release"),
          movies(context),
          listTile("Coming This Week"),
          movies(context),
        ],
      ),
    );
  }

  ListTile listTile(String leadingText) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 20),
      leading: Text(
        leadingText,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }

  SizedBox movies(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: FadeInImage.assetNetwork(
                  width: MediaQuery.of(context).size.width * 0.38,
                  fit: BoxFit.cover,
                  placeholder: "assets/loader.gif",
                  image:
                      "https://source.unsplash.com/random/${index + Random().nextInt(50)}",
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
