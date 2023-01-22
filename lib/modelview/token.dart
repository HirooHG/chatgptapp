
class Token {

  String? clearance;
  String? session;

  Token({required this.clearance, required this.session});
  Token.empty() :
    clearance = "",
    session = "";
}
