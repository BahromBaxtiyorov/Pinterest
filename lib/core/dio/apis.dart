class Endpoints{

  static String baseUrl = 'https://api.unsplash.com/';
  static String token = 'Client-ID JepRo5HOCbo62wKKvyj-A8g68OQsPKx6aZzJbtv0eTk';
  static String apiKey = '17d94b92-754f-46eb-99a0-65be65b5d18f';

  //photos
  static String getPhotos = '${baseUrl}photos?page=1&per_page=40&order_by=ASC';
  static String searchPhotos = '${baseUrl}search/photos';
  static String CollentionPhotos= '${baseUrl}collections/';

}