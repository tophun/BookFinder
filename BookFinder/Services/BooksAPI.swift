//
//  BooksAPI.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import Alamofire

/// https://developers.google.com/books/docs/v1/reference/volumes/list
///

enum BooksAPI {
    case volumes(query: String, startIndex: Int, maxResults: Int)
}

extension BooksAPI: URLRequestConvertible {
    
    var baseURL: URL{
        return URL(string: "https://www.googleapis.com/books/v1")!
    }
    
    var path: String {
        switch self {
        case .volumes:
            return "/volumes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .volumes:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        let headers = HTTPHeaders()
        return headers
    }
    
    var parameters: Parameters {
        switch self {
        case let .volumes(query, startIndex, maxResults):
            return [
                "q": query,
                "startIndex": startIndex,
                "maxResults": maxResults,
            ]
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
