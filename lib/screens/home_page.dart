import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> categories = [
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
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "NETFLIX",
          style: TextStyle(
            color: Colors.red[900],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.drag_handle_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2.07,
          child: Column(
            children: [
              Expanded(
                flex: (MediaQuery.of(context).size.height * 0.3).toInt(),
                child: topPictures(),
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

  ListView topPictures() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 15, 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              bottom: 30,
              left: 30,
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

  ListView middleCategories() {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 15, 0),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: Text(
              categories[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.color),
              image: NetworkImage(
                  "https://source.unsplash.com/random/${index + Random().nextInt(50)}"),
            ),
          ),
        );
      },
    );
  }

  Column bottomMovies(BuildContext context) {
    return Column(
      children: [
        listTile("My List"),
        container(context),
        listTile("Popular on Netflix"),
        container(context),
        listTile("New Release"),
        container(context),
        listTile("Coming This Week"),
        container(context),
      ],
    );
  }

  ListTile listTile(String leadingText) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      leading: Text(
        leadingText,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.black,
        ),
      ),
    );
  }

  SizedBox container(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.width * 038,
                fit: BoxFit.cover,
                placeholder: "assets/loader.gif",
                image:
                    "https://source.unsplash.com/random/${index + Random().nextInt(50)}",
              ),
            ),
          );
        },
      ),
    );
  }
}
