import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nav2/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/job_detail_model.dart';
import '../provider/internet_provider.dart';
import '../utils/app_loading_screen.dart';
import '../utils/hSpacer.dart';
import '../utils/internet_viewer.dart';
import '../utils/wSpacer.dart';

class JobDetailPage extends StatefulWidget {
  String job_slug;

  JobDetailPage({required this.job_slug});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  double? height;
  double? width;
  bool isLoading = true;
  JobDetailModel data = JobDetailModel();
  bool isPressedFav = true;
  bool isFavLoading = false;
  bool profile_completed = false;

  bool? checkAuth;
  bool isEmailVerified = false;
  @override
  void initState() {
    super.initState();
    jobDetailApi();
    print('The Job slug ${widget.job_slug}');
  }

  Future<void> jobDetailApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);
    var url = Uri.parse('https://knownjobz.com/api/job/' + widget.job_slug);
    print('The Job detail url : $url');
    http.Response response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    print('The Response of job detail ${response.body}');
    if (response.statusCode == 200) {
      data = JobDetailModel.fromJson(jsonDecode(response.body));

      setState(() {
        // profile_completed = false ;
        isLoading = false;
        isPressedFav = data.job!.isfavourite == 0 ? true : false;
      });
      print('The Favourite $isPressedFav , ${data.job!.isfavourite}');
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<InternetProvider>(
      builder: (context , value , child) {
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            child: isLoading
                ? AppLoadingscreen()
                : ListView(
              children: [
                hSpacer().hSpace15(),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      )),
                ),
                hSpacer().hSpace10(),
                const Text(
                  'Company Profile',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                hSpacer().hSpace15(),
                Row(
                  children: [
                    data.job?.company?.logo == null
                        ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          APP_LOGO,
                          height: 55,
                          width: 55,
                          fit: BoxFit.contain,
                        ))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        IMAGEBASEURL + data.job!.company!.logo!,
                        height: 95,
                        width: 95,
                      ),
                    ),
                    wSpacer().wSpace12(),
                    data.job?.company == null
                        ? Container()
                        : Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.job!.company!.name!,
                          style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              JOB_LOCATION,
                              height: 20,
                              width: 20,
                            ),
                            wSpacer().wSpace3(),
                            data.job?.company?.location == null ? Container(): Text(
                              data.job!.company!.location!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                              const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                hSpacer().hSpace20(),



                const Text(
                  'Job details',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                hSpacer().hSpace5(),
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Date posted at : ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey)),
                      TextSpan(
                          text: DateFormat('yyyy-MM-dd').format(
                              DateTime.parse(
                                  data.job!.createdAt!.toString())),
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey))
                    ])),
                hSpacer().hSpace10(),
                data.job!.cityIds!.isEmpty
                    ? Container()
                    : label(JOB_LOCATION,
                    '${data.job!.cityIds![0]} , ${data.job!.stateIds![0]} , ${data.job!.countryIds![0]}'),
                hSpacer().hSpace10(),
                data.job?.jobTypeIds == null
                    ? Container()
                    : data.job!.jobTypeIds!.isEmpty
                    ? Container()
                    : label(SUIT_CASE, data.job!.jobTypeIds![0]),
                hSpacer().hSpace15(),
                data.job?.jobShiftIds == null
                    ? Container()
                    : data.job!.jobShiftIds!.isEmpty
                    ? Container()
                    : label(SHIFT_TIME_ICON,
                    data.job!.jobShiftIds![0]),
                hSpacer().hSpace15(),
                data.job?.numOfPositions == null
                    ? Container()
                    : label(GROUP_PEOPLE,
                    '${data.job!.numOfPositions} positions opened'),
                hSpacer().hSpace15(),
                data.job?.salaryFrom == null
                    ? Container()
                    : label(SUIT_CASE,
                    '${data.job!.salaryFrom} - ${data.job!.salaryTo}'),
                hSpacer().hSpace15(),
                data.job?.careerLevelIds == null
                    ? Container()
                    : label(
                    CAREERLEVEL, data.job!.careerLevelIds![0]),
                hSpacer().hSpace15(),
                data.job?.numOfPositions == null
                    ? Container()
                    : label(GROUP_PEOPLE,
                    '${data.job!.numOfPositions!.toString()} openings'),
                hSpacer().hSpace15(),
                data.job?.jobExperienceIds == null
                    ? Container()
                    : data.job!.jobExperienceIds!.isEmpty
                    ? const Text('Not found')
                    : label(
                    PERMANENT_JOB,
                    data.job!.jobExperienceIds![0]
                        .toString()),
                SizedBox(
                  height: 15,
                ),
                data.job?.genderIds == null
                    ? Container()
                    : label(PERSON_ICON, data.job!.genderIds![0]),
                const SizedBox(
                  height: 15,
                ),
                data.job?.degreeLevelIds == null
                    ? Container()
                    : label(GRADUATION_ICON,
                    data.job!.degreeLevelIds![0]),
                const SizedBox(
                  height: 15,
                ),
                data.job?.expiryDate == null
                    ? Container()
                    : label(FROM_DATE_ICON,
                    'Date expired at : ${DateFormat('yyyy-MM-d').format(DateTime.parse(data.job!.expiryDate!.toString()))}'),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                data.job?.benefits == null
                    ? Container()
                    : const Text(
                  'Job Benifits',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                hSpacer().hSpace10(),
                data.job?.benefits == null
                    ? Container()
                    : Text(
                  data.job!.benefits!,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                hSpacer().hSpace20(),
                const Text(
                  'Job description',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                hSpacer().hSpace10(),
                Text(
                  data.job!.description!,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                hSpacer().hSpace20(),
                const Text(
                  'Job Skills Required',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Wrap(
                  spacing: 8.0,
                  children: data.job!.jobSkillIds!.map((e) {
                    return Chip(
                        backgroundColor: Colors.white,
                        side:
                        const BorderSide(color: Colors.blueGrey),
                        label: Text(
                          e,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blueGrey),
                        ));
                  }).toList(),
                ),
                hSpacer().hSpace30()
              ],
            ),
          )

        );
      }
    );
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please update your profile'),
            actions: <Widget>[
              !isEmailVerified
                  ? Row(
                      children: [
                        const Icon(
                          Icons.cancel,
                          color: Colors.redAccent,
                        ),
                        wSpacer().wSpace8(),
                        const Text('Email is not verified')
                      ],
                    )
                  : Container(),
              TextButton(
                child: const Text(
                  'Close',
                  style: TextStyle(color: APPCOLOR),

                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget relatedJobs() {
    return SizedBox(
      height: 250,
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.relatedJobs!.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetailPage(
                              job_slug: data.relatedJobs![index].slug!,
                            )));
              },
              child: Container(
                // height: 260,
                width: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Colors.blueGrey, width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data.relatedJobs?[index].company?.logo == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              APP_LOGO,
                              height: 65,
                              width: 65,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              IMAGEBASEURL +
                                  data.relatedJobs![index].company!.logo!,
                              height: 65,
                              width: 65,
                            ),
                          ),
                    hSpacer().hSpace20(),
                    Text(
                      data.relatedJobs![index].title!,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    hSpacer().hSpace10(),
                    data.relatedJobs![index].company == null
                        ? const SizedBox(
                            height: 1,
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/icons/campus.png',
                                height: 15,
                                width: 15,
                              ),
                              wSpacer().wSpace5(),
                              Text(
                                data.relatedJobs![index].company!.name!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                    hSpacer().hSpace10(),
                    hSpacer().hSpace10(),
                    data.relatedJobs![index].salaryFrom == null
                        ? const SizedBox(
                            height: 1,
                          )
                        : Row(
                            children: [
                              Image.asset(
                                SUIT_CASE,
                                height: 15,
                                width: 15,
                              ),
                              wSpacer().wSpace5(),
                              Text(
                                '${data.relatedJobs![index].salaryFrom} - ${data.relatedJobs![index].salaryTo}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                    hSpacer().hSpace10(),
                    data.relatedJobs![index].numOfPositions == null
                        ? Container()
                        : Row(
                            children: [
                              Image.asset(
                                GROUP_PEOPLE,
                                height: 21,
                                width: 21,
                              ),
                              wSpacer().wSpace3(),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: data
                                        .relatedJobs![index].numOfPositions!,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent)),
                                const TextSpan(
                                    text: ' positions opened',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.redAccent))
                              ])),
                            ],
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget label(String img, String text) {
    return SizedBox(
      height: 30,
      width: width,
      child: Row(
        children: [
          Image.asset(
            img,
            height: 25,
            width: 25,
          ),
          wSpacer().wSpace12(),
          Expanded(
            flex: 3,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
