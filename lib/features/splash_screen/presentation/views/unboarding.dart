// TODO move to another location and renaming
import 'package:easy_localization/easy_localization.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(title: LocaleKeys.Discover_Incredible.tr() , image: 'assets/images/img1.png', discription: LocaleKeys.Experiences_Worldwide.tr()),
  UnbordingContent(
      title: LocaleKeys.Lets_start_planning.tr(), image: 'assets/images/img2.png', discription: LocaleKeys.Lets_start_planning.tr()),
  UnbordingContent(
      title: LocaleKeys.Choose_your_experiences.tr(), image: 'assets/images/img3.png', discription:LocaleKeys.Lets_start_planning.tr()),
  UnbordingContent(
    title: LocaleKeys.Choose_your_experiences.tr(),
    image: 'assets/images/img4.png',
    discription: LocaleKeys.Choose_your_experiences.tr(),
  )
];
