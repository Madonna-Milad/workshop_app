abstract class FAQStates{}

class InitialState extends FAQStates{}
class ToggleAnswerSheetState extends FAQStates{}
class FAQloadingState extends FAQStates{}
class FAQSuccessfulState extends FAQStates{}
class FAQErorrState extends FAQStates{
  final String error;
  FAQErorrState(this.error);
}