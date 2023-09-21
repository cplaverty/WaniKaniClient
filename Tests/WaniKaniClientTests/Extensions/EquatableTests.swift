import XCTest
@testable import WaniKaniClient

final class EquatableTests: XCTestCase {
    func testStructWhenSameTypeAndStructurallyEqual() throws {
        let a: any Equatable = TestEquatableStruct1(a: 1)
        let b: any Equatable = TestEquatableStruct1(a: 1)
        
        XCTAssertTrue(a.isEqual(to: b))
        XCTAssertTrue(b.isEqual(to: a))
    }
    
    func testStructWhenDifferentTypeAndStructurallyEqual() throws {
        let a: any Equatable = TestEquatableStruct1(a: 1)
        let b: any Equatable = TestEquatableStruct2(a: 1)
        
        XCTAssertFalse(a.isEqual(to: b))
        XCTAssertFalse(b.isEqual(to: a))
    }
    
    func testStructWhenSameTypeAndStructurallyUnequal() throws {
        let a: any Equatable = TestEquatableStruct1(a: 1)
        let b: any Equatable = TestEquatableStruct1(a: 2)
        
        XCTAssertFalse(a.isEqual(to: b))
        XCTAssertFalse(b.isEqual(to: a))
    }
    
    func testClassWhenSameTypeAndStructurallyEqual() throws {
        let a: any Equatable = TestEquatableSubClass(a: 1)
        let b: any Equatable = TestEquatableSubClass(a: 1)
        
        XCTAssertTrue(a.isEqual(to: b))
        XCTAssertTrue(b.isEqual(to: a))
    }
    
    func testClassWhenSubTypeAndStructurallyEqual() throws {
        let a: any Equatable = TestEquatableBaseClass(a: 1)
        let b: any Equatable = TestEquatableSubClass(a: 1)
        
        XCTAssertFalse(a.isEqual(to: b))
        XCTAssertFalse(b.isEqual(to: a))
    }
    
    func testClassWhenSameTypeAndStructurallyUnequal() throws {
        let a: any Equatable = TestEquatableSubClass(a: 1)
        let b: any Equatable = TestEquatableSubClass(a: 2)
        
        XCTAssertFalse(a.isEqual(to: b))
        XCTAssertFalse(b.isEqual(to: a))
    }
    
    func testIncompatibleTypes() throws {
        let a: any Equatable = TestEquatableStruct1(a: 1)
        let b: any Equatable = TestEquatableSubClass(a: 1)
        
        XCTAssertFalse(a.isEqual(to: b))
        XCTAssertFalse(b.isEqual(to: a))
    }
}

// MARK: - Test Types

private struct TestEquatableStruct1: Equatable {
    var a: Int
}

private struct TestEquatableStruct2: Equatable {
    var a: Int
}

private class TestEquatableBaseClass: Equatable {
    var a: Int
    
    init(a: Int) {
        self.a = a
    }
    
    static func == (lhs: TestEquatableBaseClass, rhs: TestEquatableBaseClass) -> Bool {
        return lhs.a == rhs.a
    }
}

private final class TestEquatableSubClass: TestEquatableBaseClass {
    static func == (lhs: TestEquatableSubClass, rhs: TestEquatableSubClass) -> Bool {
        return lhs as TestEquatableBaseClass == rhs as TestEquatableBaseClass
    }
}
