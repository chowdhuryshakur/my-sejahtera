// To parse this JSON data, do
//
//     final CPRC = welcomeFromJson(jsonString);

import 'dart:convert';

class CPRC {
    CPRC({
        this.id,
        this.title,
        this.slug,
        this.image,
        this.link,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String slug;
    String image;
    dynamic link;
    DateTime date;
    String time;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory CPRC.fromRawJson(String str) => CPRC.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CPRC.fromJson(Map<String, dynamic> json) => CPRC(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        link: json["link"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "link": link,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
