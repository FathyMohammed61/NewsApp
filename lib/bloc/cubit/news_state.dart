abstract class NewsState {}

class NewsInitial extends NewsState {}

class ShowButtonState extends NewsState {}

// Business States
class BusinessloadingState extends NewsState {}

class BusinessSuccessState extends NewsState {}

class BusinessErrorState extends NewsState {
  final String error;
  BusinessErrorState(this.error);
}

// Entertainment States
class EntertainmentloadingState extends NewsState {}

class EntertainmentSuccessState extends NewsState {}

class EntertainmentErrorState extends NewsState {
  final String error;
  EntertainmentErrorState(this.error);
}

// General States
class GeneralloadingState extends NewsState {}

class GeneralSuccessState extends NewsState {}

class GeneralErrorState extends NewsState {
  final String error;
  GeneralErrorState(this.error);
}

// Health States

class HealthloadingState extends NewsState {}

class HealthSuccessState extends NewsState {}

class HealthErrorState extends NewsState {
  final String error;
  HealthErrorState(this.error);
}

// Science States
class ScienceloadingState extends NewsState {}

class ScienceSuccessState extends NewsState {}

class ScienceErrorState extends NewsState {
  final String error;
  ScienceErrorState(this.error);
}

//Sports States
class SportsloadingState extends NewsState {}

class SportsSuccessState extends NewsState {}

class SportsErrorState extends NewsState {
  final String error;
  SportsErrorState(this.error);
}

//Technology States

class TechnologyloadingState extends NewsState {}

class TechnologySuccessState extends NewsState {}

class TechnologyErrorState extends NewsState {
  final String error;
  TechnologyErrorState(this.error);
}

class ControlSwitch extends NewsState{}