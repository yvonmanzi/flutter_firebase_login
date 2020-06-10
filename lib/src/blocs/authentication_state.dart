import 'package:equatable/equatable.dart';

//this equatable thing had eluded me for weeks up until now. Now i got ya haha.
// when I was comparing states using is, I was actually using equable stuff. it
// looks at props and sees if they are the same. Otherwise they are different?
//starting to make sense, and will read further into this by going to the source code of Equatable and how it does its job.!!

/*
* Since we're using Equatable to allow us to compare different instances of
* AuthenticationState we need to pass any properties to the superclass.
* Without List<Object> get props => [displayName],
* we will not be able to properly compare different instances of Authenticated.
* */
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String displayName;

  const AuthenticationAuthenticated(this.displayName);
  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated {displayName: $displayName}';
}

class AuthenticationUnauthenticated extends AuthenticationState {}
