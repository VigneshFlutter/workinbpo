import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nav2/job_detail_page/job_detail_page.dart';
import 'package:nav2/manage_jobs/add_job_post_screen.dart';
import 'package:nav2/manage_jobs/list_candiate_screen.dart';
import 'package:nav2/manage_jobs/shortlist_job_screen.dart';
import 'package:nav2/model/company_posted_jobs_model.dart';
import 'package:nav2/model/profile_model.dart';
import 'package:nav2/plans_and_packages/plans_and_packages.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/internet_viewer.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:nav2/utils/no_results_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyPostedJobs extends StatefulWidget {
  const CompanyPostedJobs({Key? key}) : super(key: key);

  @override
  State<CompanyPostedJobs> createState() => _CompanyPostedJobsState();
}

class _CompanyPostedJobsState extends State<CompanyPostedJobs> {
  double? height;
  double? width;
  CompanyPostedJobsModel? data;
  bool isLoading = true;
  bool isDeletePressed = false;
  bool isAddPostLoading = false;
  ProfileModel profData = ProfileModel();

  var colorizeColors = [
    Colors.black,
    Colors.white,
    const Color(0xFFF1F7B5),
    const Color(0xFFFD8A8A),
    const Color(0xFF205295),
    const Color(0xFFADA2FF)
  ];

  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    companyPostedJobs();
    super.initState();
  }

  

  Future<void> companyPostedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(COMPANY_POSTED_JOBS_URL);
    http.Response response =
        await http.get(url, headers: {'Authorization': "Bearer $token"});

    print('The Response of company posted jobs ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        data = CompanyPostedJobsModel.fromJson(jsonDecode(response.body));

        isLoading = false;
      });
    } else {
      errorSnackBar('Something went wrong', context);
    }
  }

  Future<void> profileApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(PROFILE_URL);
    http.Response response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    print('The Response of profile ${response.statusCode}');

    if (response.statusCode == 200) {
      profData = ProfileModel.fromJson(jsonDecode(response.body));
      // ignore: use_build_context_synchronously
      setState(() {
        isAddPostLoading = false;
      });
      if (profData.company!.verified == 0) {
        emailNotVerifiedBottomSheet();
      } else {
        if(data!.currentPackage!.isNotEmpty){
          if (  data!.completedJobCount! <= data!.currentPackage![0].packageNumListings!) {
          packageBottomSheet();
        } else {
          setState(() {
            isAddPostLoading = true;
          });
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddJobPostScreen(
                        isEditProfile: false,
                      )));
        }
        }else{
          packageBottomSheet();
        }
      }
    } else {
      // ignore: use_build_context_synchronously
      errorSnackBar('Something went wrong', context);
    }
  }

  void emailNotVerifiedBottomSheet() {
    Scaffold.of(context).showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          height: height! / 2,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0)
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                Lottie.asset(VERIFY_MAIL, height: 125, width: 125),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Your email is not verified not yet.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await LaunchApp.openApp(
                        androidPackageName: 'com.google.android.gm');
                  },
                  child: Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.email,
                          size: 21,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Verify Email',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void packageBottomSheet() {
    Scaffold.of(context).showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          height: height! / 2,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0),
                BoxShadow(color: Colors.grey, blurRadius: 2.0)
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                Lottie.asset(PREMIUM_PACKAGE, height: 125, width: 125),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Upgrade your Packages',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlansAndPackages())),
                  child: Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5C24A),
                        borderRadius: BorderRadius.circular(13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/upgradePackage.png',
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Upgrade plan',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteJobsApi(String id) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(DELETE_API + id);
    http.Response response =
        await http.delete(url, headers: {'Authorization': 'Bearer $token'});

    print('The Response of delete jobs ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<InternetProvider>(builder: (context, value, child) {
      return !value.isInternet
          ? InternetViewer()
          : Scaffold(
              body: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.white,
                child: isLoading
                    ? const LoadingWidget()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Company Posted Jobs',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isAddPostLoading = true;
                                });
                                profileApi();
                              },
                              child: Container(
                                height: 45,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: APPCOLOR,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: isAddPostLoading
                                      ? Lottie.asset(APP_LOADING)
                                      : const Text(
                                          'Add Post',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          data!.currentPackage!.isEmpty
                              ? Container()
                              : Container(
                                  height: 115,
                                  width: width,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF1C6758),
                                        Color(0xFF3D8361),
                                        Color(0xFF68B984),
                                        Color(0xFFCEEDC7),
                                      ])),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data!.currentPackage![0]
                                                .packageTitle!,
                                            style: const TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PlansAndPackages()));
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFF5C24A),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/upgradePackage.png',
                                                    height: 18,
                                                    width: 18,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    'Upgrade plan',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      SizedBox(
                                        width: width,
                                        child: AnimatedTextKit(
                                          repeatForever: true,
                                          animatedTexts: [
                                            ColorizeAnimatedText(
                                              '${data!.currentPackage![0].packageNumDays} days left',
                                              textStyle: colorizeTextStyle,
                                              colors: colorizeColors,
                                            ),
                                            ColorizeAnimatedText(
                                              '${data!.completedJobCount} / ${data!.currentPackage![0].packageNumListings} packages available',
                                              textStyle: colorizeTextStyle,
                                              colors: colorizeColors,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          data!.jobs!.data!.isEmpty
                              ? Expanded(
                                  flex: 3,
                                  child: NoResultsPage(),
                                )
                              : Expanded(
                                  flex: 3,
                                  child: ListView.builder(
                                      itemCount: data!.jobs!.data!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            Image.asset(
                                              JOB_GREY_ICON,
                                              height: 45,
                                              width: 45,
                                              fit: BoxFit.contain,
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            data?.jobs?.data?[index].title ==
                                                    null
                                                ? Container()
                                                : Text(
                                                    data!.jobs!.data![index]
                                                        .title!,
                                                    style: const TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            data?.jobs?.data?[index]
                                                        .salaryFrom ==
                                                    null
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Image.asset(
                                                        RUPEE_ICON,
                                                        height: 15,
                                                        width: 15,
                                                        color: Colors.black54,
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          '${data!.jobs!.data![index].salaryFrom} - ${data!.jobs!.data![index].salaryTo}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black54),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            data?.jobs?.data?[index]
                                                        .numOfPositions ==
                                                    null
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Image.asset(
                                                        PEOPLES_ICON,
                                                        height: 15,
                                                        width: 15,
                                                        color: Colors.black54,
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          'No of positions ${data!.jobs!.data![index].numOfPositions!}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black54),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            RichText(
                                                text: TextSpan(
                                                    text: 'Freelance : ',
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    children: [
                                                  TextSpan(
                                                    text: data!
                                                                .jobs!
                                                                .data![index]
                                                                .isFreelance ==
                                                            0
                                                        ? 'No'
                                                        : 'Yes',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: data!
                                                                    .jobs!
                                                                    .data![
                                                                        index]
                                                                    .isFreelance ==
                                                                0
                                                            ? Colors.redAccent
                                                            : Colors.green,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            data?.jobs?.data?[index]
                                                        .description ==
                                                    null
                                                ? Container()
                                                : Text(
                                                    data!.jobs!.data![index]
                                                        .description!,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    maxLines: 2,
                                                  ),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            Align(
                                              alignment: Alignment.topRight,
                                              child: InkWell(
                                                onTap: () => moreBottomSheet(
                                                  data!
                                                      .jobs!.data![index].slug!,
                                                  index,
                                                  user_id: data!
                                                      .jobs!.data![index].id
                                                      .toString(),
                                                ),
                                                child: Container(
                                                  height: 35,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color: APPCOLOR,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: const Center(
                                                    child: Text(
                                                      'More',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            Container(
                                              height: 1,
                                              width: width,
                                              color: Colors.grey,
                                            ),

                                            // const SizedBox(height: 20,)
                                          ],
                                        );
                                      }),
                                )
                        ],
                      ),
              ),
            );
    });
  }

  void moreBottomSheet(String slug, int index, {String? user_id}) {
    showBottomSheet(
        context: context,
        elevation: 3.0,
        builder: (context) {
          return Container(
            height: height! / 2,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 2.0),
                  BoxShadow(color: Colors.grey, blurRadius: 2.0),
                  BoxShadow(color: Colors.grey, blurRadius: 2.0)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 3,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          title: const Text('View a Job'),
                          leading: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JobDetailPage(job_slug: slug)));
                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Edit"),
                          leading: SvgPicture.asset(EDIT_ICON),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddJobPostScreen(
                                          jobIndex: index,
                                          isEditProfile: true,
                                          jobData: data!,
                                        )));

                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Delete'),
                          leading: SvgPicture.asset(DELETE_ICON),
                          onTap: () {
                            deleteJobsApi(
                                data!.jobs!.data![index].id!.toString());
                            setState(() {
                              data!.jobs!.data!.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('List of Candidate'),
                          leading: SvgPicture.asset(CANDIDATE_ICON),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListCandidateScreen(
                                        user_id: user_id ?? '')));

                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('List of shortlist'),
                          leading: Image.asset(
                            SHORT_LIST_ICON,
                            height: 20,
                            width: 20,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShortListJobScreen(id: user_id ?? '')));

                            // Navigator.pop(context);
                          },
                        )
                      ],
                    ))
              ],
            ),
          );
        });
  }
}
