//
//  ViewController.swift
//  JSTPhone
//
//  Created by Artem Chernenkiy on 28.03.16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var testButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testRunner(sender: AnyObject) {

        let dataURL     = NSBundle.mainBundle().URLForResource("data", withExtension: "js")!
        let metadataURL = NSBundle.mainBundle().URLForResource("metadata", withExtension: "js")!
        let dData       = NSData(contentsOfURL: dataURL)!
        let dMetadata   = NSData(contentsOfURL: metadataURL)!
        let data        = NSString(data: dData, encoding: NSUTF8StringEncoding) as! String
        let metadata    = NSString(data: dMetadata, encoding: NSUTF8StringEncoding) as! String

        let jsrds       = { return JSTP.jsrd(data: data, metadata: metadata) }
        let parser      = { return JSTP.parse(data) as NSObject!             }
        let interpreter = { return JSTP.interprete(data)                     }

        let objects: [() -> NSObject!] = [jsrds, parser, interpreter]

        for object in objects {
            test(object)
        }
    }

    func test(object: () -> NSObject!) {
        let _begin = NSDate()
        for _ in 1...100000 {
            let _ = object()
        }
        NSLog("Parse time: \((-_begin.timeIntervalSinceNow).description)")
        print(object())
    }
}
