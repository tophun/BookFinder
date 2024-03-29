//
//  SearchViewControllerTests.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import BookFinder
import XCTest

class SearchViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SearchViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupSearchViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSearchViewController() {
        sut = SearchViewController()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class SearchBusinessLogicSpy: SearchBusinessLogic {
        var searchCalled = false
        
        func search(request: Search.Search.Request) {
            searchCalled = true
        }
    }
    
    // MARK: Tests
    
    func test_키워드입력후_검색() {
        // Given
        let spy = SearchBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        let request = Search.Search.Request(query: "테스트", startIndex: 0, maxResults: 40)
        sut.search(request: request)
        
        // Then
        XCTAssertTrue(spy.searchCalled)
    }
}
