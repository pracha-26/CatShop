class Shared {
  static const String baseUrl = "https://ecbf-2405-9800-ba20-5abd-583-b73-eabe-4d52.ngrok-free.app";
  static const String API_tokens = "d8402f1fe5ae53875e680a5acf3137d7e1d11ac6362ac4d3cda1727d6d94c01294285102c18c89a4f1ae9bcd3020a3cb5418709262871773bc2f0918b25f7532cfb4a1a4795ef1901df0dcc7f11fb91b9dd0abee743647ec98974f05c43abe0e5712ce10d8fd66816caf1b6e1d66dedb6ce64ce2a44651ca13b531250647f531";
}

class local {
  int id;
  String name;
  String email;
  String row;

  local({
    required this.id,
    required this.name,
    required this.email,
    required this.row,
  });
}