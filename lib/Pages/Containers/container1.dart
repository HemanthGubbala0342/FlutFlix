import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/Model/model.dart';
import 'package:flutflix/Services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Container1 extends ConsumerWidget {
  const Container1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return mobileContainer1(userData);
        } else {
          return desktopContainer1(userData);
        }
      },
    );
  }

  Widget mobileContainer1(AsyncValue<List<Movie>> userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upcoming",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15),
        userData.when(
          data: (data) {
            List<Movie> movie = data.map((e) => e).toList();
            return CarouselSlider.builder(
              itemCount: movie.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/${movie[index].backDropPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1.4,
                autoPlayInterval: const Duration(seconds: 3),
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.red,
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }

  Widget desktopContainer1(AsyncValue<List<Movie>> userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Upcoming",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        userData.when(
          data: (data) {
            List<Movie> movie = data.map((e) => e).toList();
            return Container(
              height: 250,
              margin: const EdgeInsets.symmetric(vertical: 25),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 230,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${movie[index].backDropPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.red,
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
