class Validator{
  static String validateEmail(String value){
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    if(! regExp.hasMatch(value))
      return 'Please Enter A Valid Email';
    else
      return null;
  }
  static String validatePassword(String value){
    Pattern pattern = r"^.{6,}$";
    RegExp regExp = new RegExp(pattern);
    if(! regExp.hasMatch(value))
      return 'Password must be at least 6 character';
    else
      return null;
  }
  static String validateName(String value){
    Pattern pattern =r"^[a-zA-Z]{1,}";
    RegExp regExp = new RegExp(pattern);
    if(! regExp.hasMatch(value))
      return 'Please enter a Valid name';
    else
      return null;
  }
  static String validatePhoneNumber(String value){
    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = new RegExp(pattern);
    if(! regExp.hasMatch(value))
      return 'Please Enter A Valid Phone Number';
    else
      return null;
  }
}
