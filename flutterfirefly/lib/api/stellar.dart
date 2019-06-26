import 'dart:io';
import 'dart:convert';


const ACCOUNTID = "GBH3JRJIKETKHA47ZRX52TRTOF63HA64VKU4BJFWR4JHLMC6E233HEDI";


getBalances()async{
  var httpClient = new HttpClient();
  var uri = Uri.parse("https://horizon.stellar.org/accounts/" + ACCOUNTID);
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  if (response.statusCode == 200) {
    var responseBody = await response.transform(utf8.decoder).join();
    return json.decode(responseBody);
  }else{
    var responseBody = await response.transform(utf8.decoder).join();
    return json.decode(responseBody);
  }
  
}