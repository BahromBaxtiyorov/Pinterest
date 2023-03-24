import 'dart:convert';

// To parse this JSON data, do
//
//     final yellowRushModel = yellowRushModelFromJson(jsonString);
List<YellowRushModel> yellowRushModelFromJson(String str) => List<YellowRushModel>.from(json.decode(str).map((x) => YellowRushModel.fromJson(x)));

String yellowRushModelToJson(List<YellowRushModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YellowRushModel {
  YellowRushModel({
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
  YellowRushModelLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;

  factory YellowRushModel.fromJson(Map<String, dynamic> json) => YellowRushModel(
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
    links: json["links"] == null ? null : YellowRushModelLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: json["topic_submissions"] == null ? null : TopicSubmissions.fromJson(json["topic_submissions"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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
  };
}

class YellowRushModelLinks {
  YellowRushModelLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory YellowRushModelLinks.fromJson(Map<String, dynamic> json) => YellowRushModelLinks(
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

class TopicSubmissions {
  TopicSubmissions({
    this.artsCulture,
    this.nature,
    this.film,
    this.streetPhotography,
  });

  ArtsCulture? artsCulture;
  Film? nature;
  Film? film;
  Film? streetPhotography;

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    artsCulture: json["arts-culture"] == null ? null : ArtsCulture.fromJson(json["arts-culture"]),
    nature: json["nature"] == null ? null : Film.fromJson(json["nature"]),
    film: json["film"] == null ? null : Film.fromJson(json["film"]),
    streetPhotography: json["street-photography"] == null ? null : Film.fromJson(json["street-photography"]),
  );

  Map<String, dynamic> toJson() => {
    "arts-culture": artsCulture?.toJson(),
    "nature": nature?.toJson(),
    "film": film?.toJson(),
    "street-photography": streetPhotography?.toJson(),
  };
}

class ArtsCulture {
  ArtsCulture({
    this.status,
  });

  String? status;

  factory ArtsCulture.fromJson(Map<String, dynamic> json) => ArtsCulture(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Film {
  Film({
    this.status,
    this.approvedOn,
  });

  String? status;
  DateTime? approvedOn;

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    status: json["status"],
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "approved_on": approvedOn?.toIso8601String(),
  };
}

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
