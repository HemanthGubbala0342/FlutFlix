import 'package:flutflix/Model/model.dart';
import 'package:flutflix/Services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Container2 extends ConsumerWidget {
  const Container2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData2 = ref.watch(userDataProvider2);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return mobileContainer2(userData2);
        } else {
          return desktopContainer2(userData2);
        }
      },
    );
  }

  Widget mobileContainer2(AsyncValue<List<Movie>> userData2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        userData2.when(
          data: (data) {
            List<Movie> movie = data.map((e) => e).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original/${movie[index].backDropPath}",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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

  Widget desktopContainer2(AsyncValue<List<Movie>> userData2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Popular",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        userData2.when(
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
