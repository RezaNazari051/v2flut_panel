import 'package:bloc/bloc.dart';


class SideBarCubit extends Cubit<int> {
  
  SideBarCubit() : super(0);


  void changePageIndex(int newIndex){
    
    emit(newIndex);
  }

}
