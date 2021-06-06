// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

// List<Info> infoFromJson(String str) => List<Info>.from(json.decode(str).map((x) => Info.fromJson(x)));

// String infoToJson(List<Info> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Info {
    final int id;
    final String firstName;
    final String lastName;

    Info({
        this.id,
        this.firstName,
        this.lastName,
    });

    factory Info.fromJson(Map<String, dynamic> json){
        return Info(id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"]);
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
    };
}
