import 'package:shopapp/consts/consts.dart';
//get user data
class fireStoreService {
static getUser(uid){
return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
}
}