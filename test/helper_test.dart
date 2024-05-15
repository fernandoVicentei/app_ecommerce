import 'package:app_ecommerce/utils/helper.dart';
import 'package:test/test.dart';

void main() {
  test('Validate URL image', () {
      bool response = isValidImageUrl(Uri.parse("https://i.imgur.com/R3iobJA.jpeg").toString());
       expect(response, true);
  });
   test('Validate is not URL image', () {
      bool response = isValidImageUrl(Uri.parse("https://i.imgur.com/R3iobJA").toString());
       expect(response, false);
  });
  
}