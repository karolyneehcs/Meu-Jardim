//
//  OnboardingUITests.swift
//  MeuJardimUITests
//
//  Created by Ana Karolina Costa da Silva on 22/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import XCTest
@testable import MeuJardim

class OnboardingUITests: XCTestCase {
    
    func test_onboarding_actionable(){
        let app = XCUIApplication()
        
        app.launchArguments = ["-reset"]
        app.launch()
        
        
        
        let app = XCUIApplication()
        let prXimoButton = app.buttons["PRÓXIMO"]
        prXimoButton.tap()
        prXimoButton.tap()
        
        let voltarStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["VOLTAR"]/*[[".buttons[\"VOLTAR\"].staticTexts[\"VOLTAR\"]",".staticTexts[\"VOLTAR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        voltarStaticText.tap()
        voltarStaticText.tap()

        _ = XCUIApplication()
        let prXimoStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["PRÓXIMO"]/*[[".buttons[\"PRÓXIMO\"].staticTexts[\"PRÓXIMO\"]",".staticTexts[\"PRÓXIMO\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(prXimoStaticText.isHittable)
        prXimoStaticText.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["VOLTAR"]/*[[".buttons[\"VOLTAR\"].staticTexts[\"VOLTAR\"]",".staticTexts[\"VOLTAR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        prXimoStaticText.tap()
        prXimoStaticText.tap()
        
        let voltarButton = app.buttons["VOLTAR"]
        XCTAssertTrue(voltarButton.isHittable)
        
        voltarButton.tap()
        voltarButton.tap()
        prXimoStaticText.tap()
        prXimoStaticText.tap()
        prXimoStaticText.tap()
        
        
    }
    
}
