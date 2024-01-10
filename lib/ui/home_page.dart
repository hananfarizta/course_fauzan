import 'package:course_fauzan/models/courses_model.dart';
import 'package:course_fauzan/providers/courses_provider.dart';
import 'package:course_fauzan/theme.dart';
import 'package:course_fauzan/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CoursesModel> courses = [];

  Future<List<CoursesModel>> fetchCourses() async {
    try {
      CoursesProvider coursesProvider = Provider.of<CoursesProvider>(context);
      List<CoursesModel> fetchedCourses = await coursesProvider.getCourses();

      courses = fetchedCourses;
      return fetchedCourses;
    } catch (error) {
      print('Error fetching Courses: $error');
      var coursesModel = CoursesModel();
      List<CoursesModel> model = [coursesModel];
      return model;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoursesModel>>(
      future: fetchCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<CoursesModel>? courses = snapshot.data;
          return content(
            coursesModelList: courses!,
          );
        }
      },
    );
  }
}

class content extends StatelessWidget {
  content({
    super.key,
    required this.coursesModelList,
  });
  final List<CoursesModel> coursesModelList;

  final TextEditingController _controller = TextEditingController();

  List<String> get halo =>
      coursesModelList.map((courses) => courses.courseName.toString()).toList();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          margin: EdgeInsets.only(left: edge, right: edge, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kategori',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Belajar Programming',
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: greyColor,
                      )
                    ],
                  ),
                ],
              ),
              Image.asset(
                'assets/IC_Notification.png',
                width: 27,
                color: whiteColor,
              )
            ],
          ));
    }

    Widget search() {
      return Container(
        margin: EdgeInsets.only(left: edge, right: edge, top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Cari course",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                suggestionsCallback: (pattern) {
                  return halo
                      .where((country) =>
                          country.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  // Handle when a suggestion is selected.
                  _controller.text = suggestion;
                  print('Selected: $suggestion');
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image.asset(
                  'assets/IC_Filter.png',
                  width: 25,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget category() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: edge,
              ),
              Container(
                height: 36,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Center(
                  child: Text(
                    'Laravel',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Container(
                height: 36,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: secondaryColor),
                child: Center(
                  child: Text(
                    'React',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Container(
                height: 36,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: secondaryColor),
                child: Center(
                  child: Text(
                    'Go',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Container(
                height: 36,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: secondaryColor),
                child: Center(
                  child: Text(
                    'PHP',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularTitle() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: edge, right: edge, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Populer',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'See more',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      );
    }

    Widget populer() {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: coursesModelList
                .map((courses) => CoursesCard(courses))
                .toList(),
          ));
    }

    Widget rekomendasi() {
      return Column(children: [
        Padding(
          padding:
              EdgeInsets.only(left: edge, right: edge, top: 30, bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rekomendasi',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'See more',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: edge,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/Image_php.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coursesModelList[0].category!,
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rp. 200.000',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_2_rounded,
                                color: whiteColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Riza Agustiansyah, S.T., M.T., Ph.D',
                                style: greyTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: edge,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/Image_react.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coursesModelList[1].category!,
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rp. 150.000',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_2_rounded,
                            color: whiteColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Belajar React Native',
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ]);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                search(),
                category(),
                popularTitle(),
                populer(),
                rekomendasi(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
