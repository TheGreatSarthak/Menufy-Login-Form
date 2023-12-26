class SignUpFailure{
  final String message;
  const SignUpFailure([this.message='An unknown error occurred']);
  factory SignUpFailure.code(String code){
    switch(code){
      case 'weak-password': return  const SignUpFailure('please enter a strong password');
      
      case 'invalid-email': return  const SignUpFailure('email is not valid');
      
      case 'email-already-in-use': return  const SignUpFailure('account already exists');
      
      case 'operation-not-allowed': return  const SignUpFailure('this operation is not allowed');
      
      case 'user-disabled': return  const SignUpFailure('this user has been disabled');
      
      default: return  const SignUpFailure();

    }
  }
}