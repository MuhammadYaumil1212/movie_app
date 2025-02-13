class ApiUrl {
  static const baseUrl =
      "https://backend-netflix-daywatch-production-ac33.up.railway.app/";
  static const apiV = 'api/v1/';

  static const signUp = '${apiV}auth/signup';
  static const signIn = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
