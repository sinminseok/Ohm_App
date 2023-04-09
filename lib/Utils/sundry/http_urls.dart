
String endpoint = "http://ec2-3-37-169-45.ap-northeast-2.compute.amazonaws.com:8080/api/";
//  #172.20.10.2 핫스팟
// 192.168.0.101집
class ManagerApi_Url{
  String findall_trainer = endpoint + "admin/findall/";

  String findall_byGymId = endpoint + "manager/findall/";

  String find_byId = endpoint + "manager/";

}

class GymApi_Url{

  String find_byId = endpoint + "gym/";

  String time_avg = endpoint+"gym/avg/";

  String decrease_count = endpoint + "gym/count-decrease/";

  String increase_count = endpoint + "gym/count-increase/";

  String current_count = endpoint + "gym/count/";

  String find_byName = endpoint + "gym/name/";

  String get_gymTime = endpoint+"gym/time/";

  String get_gymPrice = endpoint+"gym/price/";

  String findall = endpoint + "gyms";

}


class PostApi_Url{

  String find_byId = endpoint+"gymInfo/";

  String findall_bygymId = endpoint + "posts/";

  String save_post = endpoint +"gymInfo/";

  String save_postimgs = endpoint +"gymInfo/img/";
}


class Question_Url{

  String save = endpoint+"question/";

  String findall = endpoint + "question/all/";


}

const awsimg_endpoint = "https://ohm-image.s3.ap-northeast-2.amazonaws.com/";



