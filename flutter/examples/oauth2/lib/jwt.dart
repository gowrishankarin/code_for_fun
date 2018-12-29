import 'package:corsac_jwt/corsac_jwt.dart';

import './config.dart';

class JWTToken {
  String sign(Map<String, String> payload) {
    JWTBuilder builder = JWTBuilder();
    var token = builder
      ..issuer = CONFIGURATIONS.ivyEndPoint
      ..expiresAt = DateTime.now().add(Duration(minutes: 15))
      ..setClaim('data', {'email': 'gowrishankar.m@ivymobility.com'})
      ..getToken();

    var signer = JWTHmacSha256Signer(CONFIGURATIONS.googleSecret);
    var signedToken = builder.getSignedToken(signer);

    return signedToken.toString();
  }

  bool verify(String token, JWTHmacSha256Signer signer) {
    var decodedToken  = JWT.parse(token);
    bool isVerified =  decodedToken.verify(signer);

    if(!isVerified) {
      return false;
    }
    print('DECODED TOKEN');
    print(decodedToken);

    print(decodedToken.getClaim('data'));

    var validator = new JWTValidator()
      ..issuer = CONFIGURATIONS.ivyEndPoint;

    Set<String> errors = validator.validate(decodedToken);
    print(errors);

    return errors.length == 0 ? true : false;
  }
}