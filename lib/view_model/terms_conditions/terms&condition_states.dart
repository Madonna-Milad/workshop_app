abstract class TermsAndConditionsStates {}

class InitialState extends TermsAndConditionsStates{}
class TermsloadingState extends TermsAndConditionsStates{}
class TermsSuccessfulState extends TermsAndConditionsStates{}
class TermsErorrState extends TermsAndConditionsStates{
  final String error;
  TermsErorrState(this.error);
}
