import 'package:flutter/material.dart';
import 'dart:math';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: appBar(context),
          ),
          Expanded(
            flex: 6,
            child: body(context),
          ),
        ],
      ),
    );
  }

  Stack appBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.elliptical(500, 80),
                ),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://source.unsplash.com/random/${Random().nextInt(50)}}",
                  ),
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "Netflix",
                  style: TextStyle(
                    color: Color(0xFFE14053),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                const Spacer(flex: 1),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                const Spacer(flex: 8),
                IconButton(
                  icon: const Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                const Spacer(flex: 1),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.035,
          left: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Color(0xFFE14053),
              size: 40,
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              primary: Colors.white,
              shape: const CircleBorder(),
              fixedSize: const Size(60, 60),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Column body(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "THE NUTCRACKER AND\nTHE FOUR REALMS",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Text(
          "Adventure, Family, Fantasy",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            star(const Color(0xFFE14053)),
            star(const Color(0xFFE14053)),
            star(const Color(0xFFE14053)),
            star(const Color(0xFFE14053)),
            star(Colors.black),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            shortInfo("Year", "2018"),
            shortInfo("Country", "USA"),
            shortInfo("Lenght", "112 min"),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book...",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
            ),
          ),
        ),
        ListTile(
          leading: const Text(
            "Screenshots",
            style: TextStyle(
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
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: FadeInImage.assetNetwork(
                    width: MediaQuery.of(context).size.width * 0.38,
                    fit: BoxFit.cover,
                    placeholder: "assets/loader.gif",
                    image:
                        "https://source.unsplash.com/random/${index + Random().nextInt(50)}",
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Icon star(Color color) {
    return Icon(
      Icons.star,
      color: color,
      size: 20,
    );
  }

  Column shortInfo(String title, String subtitle) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
