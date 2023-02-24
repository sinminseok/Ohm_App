
String endpoint = "http://192.168.0.101:8080/api/";

class ManagerApi_Url{

  String save_manager = endpoint + "manager";

  String findall_trainer = endpoint + "manager/findall/";

  String save_trainer = endpoint +  "trainer";

  String info_manager = endpoint + "manager/info/";

  String login_manager = endpoint + "manager/login";

  //GymId로 해당 Gym에 소속된 manager모두조회
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



