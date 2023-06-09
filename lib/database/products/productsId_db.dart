// To parse this JSON data, do
//
//     final productsId = productsIdFromJson(jsonString);

import 'dart:convert';

ProductsId productsIdFromJson(String str) => ProductsId.fromJson(json.decode(str));

String productsIdToJson(ProductsId data) => json.encode(data.toJson());

class ProductsId {
    ProductsIdData data;
    Meta meta;

    ProductsId({
        required this.data,
        required this.meta,
    });

    factory ProductsId.fromJson(Map<String, dynamic> json) => ProductsId(
        data: ProductsIdData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class ProductsIdData {
    int id;
    PurpleAttributes attributes;

    ProductsIdData({
        required this.id,
        required this.attributes,
    });

    factory ProductsIdData.fromJson(Map<String, dynamic> json) => ProductsIdData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class PurpleAttributes {
    String pName;
    int pPrice;
    String pDescription;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    PImage pImage;
    Categories categories;

    PurpleAttributes({
        required this.pName,
        required this.pPrice,
        required this.pDescription,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.pImage,
        required this.categories,
    });

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        pName: json["p_name"],
        pPrice: json["p_price"],
        pDescription: json["p_description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        pImage: PImage.fromJson(json["p_image"]),
        categories: Categories.fromJson(json["categories"]),
    );

    Map<String, dynamic> toJson() => {
        "p_name": pName,
        "p_price": pPrice,
        "p_description": pDescription,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "p_image": pImage.toJson(),
        "categories": categories.toJson(),
    };
}

class Categories {
    List<Datum> data;

    Categories({
        required this.data,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    DatumAttributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DatumAttributes {
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    String cgNameTh;
    String cgNameEn;

    DatumAttributes({
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.cgNameTh,
        required this.cgNameEn,
    });

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        cgNameTh: json["cg_name_th"],
        cgNameEn: json["cg_name_en"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "cg_name_th": cgNameTh,
        "cg_name_en": cgNameEn,
    };
}

class PImage {
    PImageData data;

    PImage({
        required this.data,
    });

    factory PImage.fromJson(Map<String, dynamic> json) => PImage(
        data: PImageData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class PImageData {
    int id;
    FluffyAttributes attributes;

    PImageData({
        required this.id,
        required this.attributes,
    });

    factory PImageData.fromJson(Map<String, dynamic> json) => PImageData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class FluffyAttributes {
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

    FluffyAttributes({
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

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
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

    Formats({
        required this.thumbnail,
    });

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
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

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
