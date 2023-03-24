// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.total,
    this.totalPages,
    this.results,
  });

  int? total;
  int? totalPages;
  List<Result>? results;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    total: json["total"],
    totalPages: json["total_pages"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
    this.tags,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  ResultLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  ResultTopicSubmissions? topicSubmissions;
  User? user;
  List<Tag>? tags;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    links: json["links"] == null ? null : ResultLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: json["topic_submissions"] == null ? null : ResultTopicSubmissions.fromJson(json["topic_submissions"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "links": links?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions?.toJson(),
    "user": user?.toJson(),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
  };
}

class ResultLinks {
  ResultLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Tag {
  Tag({
    this.type,
    this.title,
    this.source,
  });

  Type? type;
  String? title;
  Source? source;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "title": title,
    "source": source?.toJson(),
  };
}

class Source {
  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  CoverPhoto? coverPhoto;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    ancestry: json["ancestry"] == null ? null : Ancestry.fromJson(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: json["cover_photo"] == null ? null : CoverPhoto.fromJson(json["cover_photo"]),
  );

  Map<String, dynamic> toJson() => {
    "ancestry": ancestry?.toJson(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto?.toJson(),
  };
}

class Ancestry {
  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  Category? type;
  Category? category;
  Category? subcategory;

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
    type: json["type"] == null ? null : Category.fromJson(json["type"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type?.toJson(),
    "category": category?.toJson(),
    "subcategory": subcategory?.toJson(),
  };
}

class Category {
  Category({
    this.slug,
    this.prettySlug,
  });

  String? slug;
  String? prettySlug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    slug: json["slug"],
    prettySlug: json["pretty_slug"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "pretty_slug": prettySlug,
  };
}

class CoverPhoto {
  CoverPhoto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
    this.premium,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  ResultLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  CoverPhotoTopicSubmissions? topicSubmissions;
  User? user;
  bool? premium;

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    links: json["links"] == null ? null : ResultLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: json["topic_submissions"] == null ? null : CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    premium: json["premium"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "links": links?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions?.toJson(),
    "user": user?.toJson(),
    "premium": premium,
  };
}

class CoverPhotoTopicSubmissions {
  CoverPhotoTopicSubmissions({
    this.nature,
    this.wallpapers,
    this.texturesPatterns,
    this.spirituality,
    this.health,
    this.colorOfWater,
  });

  ArtsCulture? nature;
  ArtsCulture? wallpapers;
  ArtsCulture? texturesPatterns;
  ArtsCulture? spirituality;
  ArtsCulture? health;
  ArtsCulture? colorOfWater;

  factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) => CoverPhotoTopicSubmissions(
    nature: json["nature"] == null ? null : ArtsCulture.fromJson(json["nature"]),
    wallpapers: json["wallpapers"] == null ? null : ArtsCulture.fromJson(json["wallpapers"]),
    texturesPatterns: json["textures-patterns"] == null ? null : ArtsCulture.fromJson(json["textures-patterns"]),
    spirituality: json["spirituality"] == null ? null : ArtsCulture.fromJson(json["spirituality"]),
    health: json["health"] == null ? null : ArtsCulture.fromJson(json["health"]),
    colorOfWater: json["color-of-water"] == null ? null : ArtsCulture.fromJson(json["color-of-water"]),
  );

  Map<String, dynamic> toJson() => {
    "nature": nature?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "textures-patterns": texturesPatterns?.toJson(),
    "spirituality": spirituality?.toJson(),
    "health": health?.toJson(),
    "color-of-water": colorOfWater?.toJson(),
  };
}

class ArtsCulture {
  ArtsCulture({
    this.status,
    this.approvedOn,
  });

  Status? status;
  DateTime? approvedOn;

  factory ArtsCulture.fromJson(Map<String, dynamic> json) => ArtsCulture(
    status: statusValues.map[json["status"]]!,
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
    "approved_on": approvedOn?.toIso8601String(),
  };
}

enum Status { APPROVED, REJECTED }

final statusValues = EnumValues({
  "approved": Status.APPROVED,
  "rejected": Status.REJECTED
});

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}

class User {
  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
    profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: json["social"] == null ? null : Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links?.toJson(),
    "profile_image": profileImage?.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social?.toJson(),
  };
}

class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String? small;
  String? medium;
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

enum Type { SEARCH, LANDING_PAGE }

final typeValues = EnumValues({
  "landing_page": Type.LANDING_PAGE,
  "search": Type.SEARCH
});

class ResultTopicSubmissions {
  ResultTopicSubmissions({
    this.technology,
    this.artsCulture,
    this.nature,
    this.businessWork,
    this.architectureInterior,
    this.interiors,
    this.people,
    this.spirituality,
    this.health,
    this.wallpapers,
    this.film,
    this.athletics,
    this.currentEvents,
    this.fashionBeauty,
    this.travel,
    this.streetPhotography,
  });

  ArtsCulture? technology;
  ArtsCulture? artsCulture;
  ArtsCulture? nature;
  ArtsCulture? businessWork;
  ArchitectureInterior? architectureInterior;
  ArchitectureInterior? interiors;
  ArchitectureInterior? people;
  ArchitectureInterior? spirituality;
  ArtsCulture? health;
  ArchitectureInterior? wallpapers;
  ArchitectureInterior? film;
  ArchitectureInterior? athletics;
  ArchitectureInterior? currentEvents;
  ArchitectureInterior? fashionBeauty;
  ArchitectureInterior? travel;
  ArchitectureInterior? streetPhotography;

  factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) => ResultTopicSubmissions(
    technology: json["technology"] == null ? null : ArtsCulture.fromJson(json["technology"]),
    artsCulture: json["arts-culture"] == null ? null : ArtsCulture.fromJson(json["arts-culture"]),
    nature: json["nature"] == null ? null : ArtsCulture.fromJson(json["nature"]),
    businessWork: json["business-work"] == null ? null : ArtsCulture.fromJson(json["business-work"]),
    architectureInterior: json["architecture-interior"] == null ? null : ArchitectureInterior.fromJson(json["architecture-interior"]),
    interiors: json["interiors"] == null ? null : ArchitectureInterior.fromJson(json["interiors"]),
    people: json["people"] == null ? null : ArchitectureInterior.fromJson(json["people"]),
    spirituality: json["spirituality"] == null ? null : ArchitectureInterior.fromJson(json["spirituality"]),
    health: json["health"] == null ? null : ArtsCulture.fromJson(json["health"]),
    wallpapers: json["wallpapers"] == null ? null : ArchitectureInterior.fromJson(json["wallpapers"]),
    film: json["film"] == null ? null : ArchitectureInterior.fromJson(json["film"]),
    athletics: json["athletics"] == null ? null : ArchitectureInterior.fromJson(json["athletics"]),
    currentEvents: json["current-events"] == null ? null : ArchitectureInterior.fromJson(json["current-events"]),
    fashionBeauty: json["fashion-beauty"] == null ? null : ArchitectureInterior.fromJson(json["fashion-beauty"]),
    travel: json["travel"] == null ? null : ArchitectureInterior.fromJson(json["travel"]),
    streetPhotography: json["street-photography"] == null ? null : ArchitectureInterior.fromJson(json["street-photography"]),
  );

  Map<String, dynamic> toJson() => {
    "technology": technology?.toJson(),
    "arts-culture": artsCulture?.toJson(),
    "nature": nature?.toJson(),
    "business-work": businessWork?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
    "interiors": interiors?.toJson(),
    "people": people?.toJson(),
    "spirituality": spirituality?.toJson(),
    "health": health?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "film": film?.toJson(),
    "athletics": athletics?.toJson(),
    "current-events": currentEvents?.toJson(),
    "fashion-beauty": fashionBeauty?.toJson(),
    "travel": travel?.toJson(),
    "street-photography": streetPhotography?.toJson(),
  };
}

class ArchitectureInterior {
  ArchitectureInterior({
    this.status,
  });

  Status? status;

  factory ArchitectureInterior.fromJson(Map<String, dynamic> json) => ArchitectureInterior(
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
