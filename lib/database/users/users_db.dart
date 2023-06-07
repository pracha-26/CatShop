// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    int id;
    String username;
    String email;
    String provider;
    bool confirmed;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    String? phone;
    List<UserImage>? userImage;

    Users({
        required this.id,
        required this.username,
        required this.email,
        required this.provider,
        required this.confirmed,
        required this.blocked,
        required this.createdAt,
        required this.updatedAt,
        this.phone,
        this.userImage,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        phone: json["phone"],
        userImage: json["user_image"] == null ? [] : List<UserImage>.from(json["user_image"]!.map((x) => UserImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "phone": phone,
        "user_image": userImage == null ? [] : List<dynamic>.from(userImage!.map((x) => x.toJson())),
    };
}

class UserImage {
    int id;
    String name;
    dynamic alternativeText;
    dynamic caption;
    int width;
    int height;
    Formats formats;
    String hash;
    String ext;
    String mime;
    double size;
    String url;
    dynamic previewUrl;
    String provider;
    dynamic providerMetadata;
    DateTime createdAt;
    DateTime updatedAt;

    UserImage({
        required this.id,
        required this.name,
        this.alternativeText,
        this.caption,
        required this.width,
        required this.height,
        required this.formats,
        required this.hash,
        required this.ext,
        required this.mime,
        required this.size,
        required this.url,
        this.previewUrl,
        required this.provider,
        this.providerMetadata,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Formats {
    Thumbnail thumbnail;
    Thumbnail? small;
    Thumbnail? large;
    Thumbnail? medium;

    Formats({
        required this.thumbnail,
        this.small,
        this.large,
        this.medium,
    });

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small?.toJson(),
        "large": large?.toJson(),
        "medium": medium?.toJson(),
    };
}

class Thumbnail {
    String name;
    String hash;
    String ext;
    String mime;
    dynamic path;
    int width;
    int height;
    double size;
    String url;

    Thumbnail({
        required this.name,
        required this.hash,
        required this.ext,
        required this.mime,
        this.path,
        required this.width,
        required this.height,
        required this.size,
        required this.url,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
    };
}
