@testable import Tree_Tracker
import XCTest

class ProtectEarthCodableTests: XCTestCase {
    
    private var decoder: JSONDecoder = JSONDecoder()
    private var encoder: JSONEncoder = JSONEncoder()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProtectEarthSupervisorDecoding() throws {
        let json = """
        [
          {
            "id": "497f6eca-6276-4993-bfeb-53cbbbba6f08",
            "name": "Spag Bol"
          },
          {
            "id": "334f6bbc-6276-4993-bfeb-53cbbbba6f08",
            "name": "Clam Chowder"
          }
        ]
        """.data(using: .utf8)!
        
        let supervisors = try decoder.decode([ProtectEarthSupervisor].self, from: json)
        
        XCTAssertNotNil(supervisors)
        XCTAssertEqual(2, supervisors.count)
        XCTAssertEqual("Spag Bol", supervisors[0].name)
        XCTAssertEqual("497f6eca-6276-4993-bfeb-53cbbbba6f08", supervisors[0].id)
        XCTAssertEqual("Clam Chowder", supervisors[1].name)
        XCTAssertEqual("334f6bbc-6276-4993-bfeb-53cbbbba6f08", supervisors[1].id)
        
        let super_0 = supervisors[0].toSupervisor()
        XCTAssertEqual("Spag Bol", super_0.name)
        XCTAssertEqual("497f6eca-6276-4993-bfeb-53cbbbba6f08", super_0.id)
        
        let json_empty = "[]".data(using: .utf8)!
        let supervisors_empty = try decoder.decode([ProtectEarthSupervisor].self, from: json_empty)
        
        XCTAssertNotNil(supervisors_empty)
        XCTAssertEqual(0, supervisors_empty.count)
    }
    
    func testProtectEarthSiteDecoding() throws {
        let json = """
        [
          {
            "id": "497f6eca-6276-4993-bfeb-53cbbbba6f08",
            "name": "Bourton on the Water",
            "location": "Cheltenham, England",
            "url": "https://www.protect.earth/projects/bourton-on-the-water",
            "plantedTrees": 710,
            "coordinates": {
              "latitude": 51.87351,
              "longitude": -1.90973
            }
          },
          {
            "id": "497f6eca-6276-4993-cdac-53cbbbba6f08",
            "name": "Slapton Bottom",
            "location": "Bodmin, England",
            "url": "https://www.protect.earth/projects/slapton-bottom",
            "plantedTrees": 5,
            "coordinates": {
              "latitude": 53.99991,
              "longitude": -1.80173
            }
          },
          {
            "id":"54e7d6f8-8c2a-4d7b-8ba8-90de42b55087",
            "name":"4C93CA3C-F8FC-4743-9F63-8CD2ED2537AF",
            "location":"",
            "url":null,
            "plantedTrees":0,
            "coordinates": {
              "latitude":0,
              "longitude":0
            }
          }
        ]
        """.data(using: .utf8)!
        
        let sites = try decoder.decode([ProtectEarthSite].self, from: json)
        
        XCTAssertNotNil(sites)
        XCTAssertEqual(3, sites.count)
        XCTAssertEqual("497f6eca-6276-4993-bfeb-53cbbbba6f08", sites[0].id)
        XCTAssertEqual("Slapton Bottom", sites[1].name)
        XCTAssertEqual("Cheltenham, England", sites[0].location)
        XCTAssertEqual(710, sites[0].plantedTrees)
        XCTAssertEqual("www.protect.earth", sites[0].url?.host)
        
        let site_0 = sites[0].toSite()
        XCTAssertEqual("497f6eca-6276-4993-bfeb-53cbbbba6f08", site_0.id)
        XCTAssertEqual("Bourton on the Water", site_0.name)
        
        let site_1 = sites[1].toSite()
        XCTAssertEqual("497f6eca-6276-4993-cdac-53cbbbba6f08", site_1.id)
        XCTAssertEqual("Slapton Bottom", site_1.name)
        
        let json_empty = "[]".data(using: .utf8)!
        let sites_empty = try decoder.decode([ProtectEarthSite].self, from: json_empty)
        
        XCTAssertNotNil(sites_empty)
        XCTAssertEqual(0, sites_empty.count)
    }

}
