//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 15/09/22.
//

import Foundation

struct Constants {
    static let API_KEY = "009c8af9c5894d8fdf81f75a4924ea2b"
    static let baseURL = "https://api.themoviedb.org"
    static let trendingMoviesURL = baseURL + "/3/trending/movie/day?api_key=" + API_KEY
    static let trendingTvsURL = baseURL + "/3/trending/tv/day?api_key=" + API_KEY
    static let upcomingMoviesURL = baseURL + "/3/movie/upcoming?api_key=" + API_KEY + "&language=en-US&page=1"
    static let popularMoviesURL = baseURL + "/3/movie/popular?api_key=" + API_KEY + "&language=en-US&page=1"
    static let topRatedTvsURL = baseURL + "/3/tv/top_rated?api_key=" + API_KEY + "&language=en-US&page=1"
    static let imageURL = "https://image.tmdb.org/t/p/w500/"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.trendingMoviesURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.trendingTvsURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.upcomingMoviesURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.popularMoviesURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTopRatedTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Constants.trendingTvsURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
}
