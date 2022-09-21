abstract class NewsStates{}

class InitialState extends NewsStates{}
class NewsloadingState extends NewsStates{}
class NewsSuccessfulState extends NewsStates{}
class NewsErorrState extends NewsStates{
  final String error;
  NewsErorrState(this.error);
}

class NewsDescriptionloadingState extends NewsStates{}

//top snake bar flutter