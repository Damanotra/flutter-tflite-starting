import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SearchState {
  final bool initialized;
  final List allUser;
  final int index;
  final bool isLoading;
  final bool isError;

  SearchState(
      {@required this.initialized,
        @required this.allUser,
        @required this.index,
        @required this.isLoading,
        @required this.isError});

  //initial state
  factory SearchState.initial() {
    return SearchState(
      initialized: true,
        allUser: [],
        index: 0,
        isLoading: false,
        isError: false
    );
  }

  factory SearchState.isLoading(){
    return SearchState(
        initialized: false,
        allUser: [],
        index: 0,
        isLoading: true,
        isError: false
    );
  }

  factory SearchState.isLoaded(List allUser){
    return SearchState(
      initialized: false,
      allUser: allUser,
      index: 0,
      isLoading: false,
      isError: false
    );
  }

  factory SearchState.swiped(int index) {
    return SearchState(
      initialized: false,
        allUser: [],
        index : index,
        isLoading: false,
        isError: false
    );
  }

  factory SearchState.failure() {
    return SearchState(
      initialized: false,
        allUser: [],
        isLoading: false,
        isError: false
    );
  }



  SearchState copyWith({
    bool initialized,
    List allUser,
    int index,
    bool isLoading,
    bool isError
  }) {
    return SearchState(
      initialized: initialized ?? this.initialized,
        allUser: allUser ?? this.allUser,
        index: index ?? this.index,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError);
  }
}
