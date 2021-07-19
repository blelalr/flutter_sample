import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserPhotoView extends StatelessWidget {
  final isVerified;

  const UserPhotoView({Key? key, this.isVerified}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/icon/no_photo.svg',
                width: 96,
                height: 96,
              ),
            ),
          ),
          isVerified ? VerifiedIcon() : NoPhotoIcon(),
        ]),
      ),
    );
  }
}

class VerifiedIcon extends StatelessWidget {
  const VerifiedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 82 + 16 - 14,
        top: 82 - 14,
        child: Image.asset(
          'assets/pic/verified_f_profile.png',
          width: 28,
          height: 28,
        ));
  }
}

class NoPhotoIcon extends StatelessWidget {
  const NoPhotoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 82 + 16 - 18,
        top: 82 - 18,
        child: Image.asset(
          'assets/pic/icon_with_o_small.png',
          width: 36,
          height: 36,
        ));
  }
}
