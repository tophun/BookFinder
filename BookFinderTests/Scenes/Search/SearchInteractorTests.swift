//
//  SearchInteractorTests.swift
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

class SearchInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SearchInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupSearchInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSearchInteractor() {
        sut = SearchInteractor()
    }
    
    // MARK: Test doubles
    
    class SearchPresentationLogicSpy: SearchPresentationLogic {
        var presentSomethingCalled = false
        
        func presentSomething(response: Search.Something.Response) {
            presentSomethingCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDoSomething() {
        // Given
        let spy = SearchPresentationLogicSpy()
        sut.presenter = spy
        let request = Search.Something.Request()
        
        // When
        //sut.doSomething(request: request)
        
        // Then
        XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
    }
}
