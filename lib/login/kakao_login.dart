import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:memotive/login/social_login.dart';

class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) { // 카카오톡 설치된 유저
        try {
          await UserApi.instance.loginWithKakaoTalk(); // 카카오톡으로 로그인
          return true;
        } catch (e) {
          return false;
        }
      } else { // 카카오톡 설치 안 된 유저
        try {
          await UserApi.instance.loginWithKakaoAccount(); // 카카오 계정으로 로그인
        } catch (e) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}