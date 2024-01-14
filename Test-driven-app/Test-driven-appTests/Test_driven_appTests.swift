//
//  Test_driven_appTests.swift
//  Test-driven-appTests
//
//  Created by Kate on 10/01/2024.
//

import XCTest
@testable import Test_driven_app

final class TDDCWAppTestsDataModel: XCTestCase {
    
    var sut: DataModel! // ссылка - system under test (ссылка на тестируемый модуль)

    // MARK : - жизненные циклы TDDCWAppTests
    
    override func setUpWithError() throws {
        print("setUpWithError")
    }
    
    /*
     Пример как отключить permissions доступа к контактам в рамках теста:

     override func setUpWithError() throws {
             if #available(iOS 13.4, *) {
                 application.resetAuthorizationStatus(for: .contacts)
             } else {
                 throw XCTSkip("Required API is not available for this test.")
             }
     }

     В коде выше мы сбрасываем доступ к контактам в предусловии, если симулятор с версией iOS выше или равно 13.4. Если же нет, мы пропускам тест в прогоне.
     */
    
    /// throws - нужны если мы можем не иметь данные
    /// используется для создания обьектов необходимых для тестирования
    /// (как init в контроллере)
    override func setUp() {
        print("setUp")
        super.setUp() // до создания обьектов
        sut = DataModel()
    }
    
    /// (как deinit в контроллере)
    // вызывается после окончания тестирования модуля, для выгрузить из памяти
    override func tearDown() {
        print("tearDown")
        sut = nil
        super.tearDown() // обязательно после выгрузки объектов
    }

    override func tearDownWithError() throws {
        print("tearDownWithError")
    }

    // все тестовые func начинаются со слова test !!!

    // 1 = = = = = = = = = = = = =
    
    // нижнее значение должно ровняться 0
    func testLowestVolumeShouldBeZero() {
        print("testLowestVolumeShouldBeZero")
        
        // блок 1 - given (что дано)
        sut.setVolume(with: -1)
        
        // блок 2 - when (что произошло)
        let volume = sut.volume
        
        // блок 3 - then (что должно получиться)
        // XCTAssert - метод утвержданет что ...
        XCTAssert(volume == 0, "Lowest volume should be equal 0")
        // (volume == 0) => true -> успех / false -> сообщение
    }
    
    // максимальное значение должно ровняться 100
    func testHighestVolumeShouldBe100() {
        print("testExample2")
        // given (что дано)
        sut.setVolume(with: 101)
        // when (что произошло)
        let volume = sut.volume
        // then (что должно получиться)
        XCTAssert(volume == 100, "Highest volume should be equal 100")
    }
    
    // Сode coverage - позволяет увидеть покрытие тестами кода.
    // можем увидеть сколько раз метод вызывался при тестировании

    
    // 2 = = = = = = = = = = = = =
    
    // Проверяем на true
    func testNumberOneMustBeGreaterThanNumberTwo() {
        //given
        let numberOne = 2
        let numberTwo = 1
        // when
        let result = sut.greaterThanValue(x: numberOne, y: numberTwo)
        // then
        XCTAssert(result, "The number one must be greater than number two")
    }
    
    // Проверяем на false
    func testNumberOneMustNotBeGreaterThanNumberTwo() {
        //given
        let numberOne = 1
        let numberTwo = 2
        // when
        let result = sut.greaterThanValue(x: numberOne, y: numberTwo)
        // then
        XCTAssert(!result, "The number one must be greater than number two")
    }
    
    // 3 = = = = = = = = = = = = =
    
    // значение делится на 3?
    func testIsDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 3)
        XCTAssertEqual(result, true)
    }
    
    // значение делится на 3? Проверка на false
    func testIsNotDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 1)
        XCTAssertEqual(result, false)
    }
    
    // = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

    // пример тестового метода (на производительность)
    // отрабатывает 10 раз 1 блок кода и выводит его пр-ть
    // можно замерять улучшение производительности после оптимизации / рефакторинго кода
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            for v in 1 ... 1000 {
                sut.setVolume(with: v)
            }
        }
    }

    class MathService {
        func add(_ a: Int, _ b: Int) -> Int {
            return a + b
        }

        func multiply(_ a: Int, _ b: Int) -> Int {
            return a * b
        }

        func divide(_ a: Double, _ b: Double) throws -> Double {
            guard b != 0 else {
                throw MathError.divisionByZero
            }
            return a / b
        }
    }

    enum MathError: Error {
        case divisionByZero
    }

    class MathServiceTests: XCTestCase {
        let mathService = MathService()

        func testAddition() {
            XCTAssertEqual(mathService.add(2, 3), 5)
        }

        func testMultiplication() {
            XCTAssertEqual(mathService.multiply(4, 5), 20)
        }

        func testDivision() {
            XCTAssertNoThrow(try mathService.divide(10.0, 2.0))
            XCTAssertEqual(try? mathService.divide(10.0, 2.0), 5.0)

            XCTAssertThrowsError(try mathService.divide(5.0, 0.0)) { error in
                XCTAssertEqual(error as? MathError, MathError.divisionByZero)
            }
        }
    }
}
