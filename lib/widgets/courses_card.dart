import 'package:course_fauzan/models/courses_model.dart';
import 'package:course_fauzan/theme.dart';
import 'package:course_fauzan/ui/detail_produk_page.dart';
import 'package:flutter/material.dart';

class CoursesCard extends StatelessWidget {
  final CoursesModel courses;
  const CoursesCard(this.courses, {super.key});

  @override
  Widget build(BuildContext context) {
    var id = courses.id;
    return Row(
      children: [
        SizedBox(
          width: edge,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduk(),
                  settings: RouteSettings(
                    arguments: id,
                  ),
                ));
          },
          child: SizedBox(
              child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 290,
                width: 237,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.38),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 1.07,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 6.41,
                      offset: Offset(0, 2.14),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 25.66,
                      offset: Offset(0, 17.10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: courses.courseName == "Belajar PHP"
                      ? Image.asset(
                          'assets/Image_php.png',
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/Image_react.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                width: 237.31,
                height: 290.76,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      const Color(0x000C0C0C),
                      Colors.black.withOpacity(0.800000011920929)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.38),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: edge, bottom: edge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courses.courseName!,
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      courses.category!,
                      style: whiteTextStyle2.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        SizedBox(
          width: edge,
        ),
      ],
    );
  }
}
