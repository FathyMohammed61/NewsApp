import 'package:flutter/material.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/entertainment_screen.dart';
import 'package:news_app/screens/general_screen.dart';
import 'package:news_app/screens/health_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/screens/technology_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

buildBodyItem(articals, context) {
  var urlLauncherImage = articals['urlToImage'];
  var urlLauncherNews = articals['url'];
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            launchUrlString(urlLauncherImage);
          },
          child: Card(
            child: Image(
              image: NetworkImage(articals['urlToImage']),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "WebsSite NEWS 📰 ==>",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrlString(urlLauncherNews);
              },
              child: Text(
                articals['source']['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 23,
                    color: Color.fromARGB(255, 85, 29, 197),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const Divider(
            color: Color.fromARGB(255, 8, 24, 100),
            height: 20,
            indent: 55,
            endIndent: 55,
            thickness: 2),
        Column(
          children: [
            const Text(
              "The News:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              articals['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(255, 85, 29, 197),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
            color: Color.fromARGB(255, 8, 24, 100),
            height: 20,
            indent: 55,
            endIndent: 55,
            thickness: 2),
        Column(
          children: [
            const Text(
              "Description Of News:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              articals['description'],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(255, 85, 29, 197),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}

TextStyle style = TextStyle(
    fontSize: 25,
    color: Colors.blueAccent.shade700,
    fontWeight: FontWeight.w600);

Widget bottomScreen(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Business News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const BusinessScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Entertainment News",
              style: style,
            ),
            IconButton(
                onPressed: () =>
                    navigateTo(context, const EntertainmentScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "General News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const GeneralScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Science News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const ScienceScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sports News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const SportsScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Technology News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const TechnologyScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Health News",
              style: style,
            ),
            IconButton(
                onPressed: () => navigateTo(context, const HealthScreen()),
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ],
    ),
  );
}

void navigateTo(context, screens) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => screens)));
}

Widget floatingButton(GlobalKey<ScaffoldState> scaffoldkey) =>
    FloatingActionButton.extended(
      onPressed: () {
        scaffoldkey.currentState?.showBottomSheet(
          (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(top: 25),
            height: 375,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: bottomScreen(context),
          ),
        );
      },
      icon: const Icon(Icons.add),
      label: const Text("Choose News"),
    );
