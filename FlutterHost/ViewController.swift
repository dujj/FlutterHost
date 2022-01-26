//
//  ViewController.swift
//  FlutterHost
//
//  Created by dujianjie on 2022/1/25.
//
import Flutter
import FlutterPluginRegistrant
import UIKit

class ViewController: UIViewController {

    private let group = FlutterEngineGroup(name: "com.flutter.host", project: nil);
    
    private var engine: FlutterEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        engine = group.makeEngine(withEntrypoint: "testMyApp", libraryURI: nil)
        
        let button = UIButton(type: .custom)
        button.setTitle("Open Flutter View", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(openFlutterViewController), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 300, width: 120, height: 48)
        view.addSubview(button)
    }

    @objc private func openFlutterViewController() {
        let ctl = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        self.showDetailViewController(ctl, sender: nil)
    }
}

