//
//  ViewController.swift
//  I am Rich
//
//  Created by Kevin Christopher Piovezan on 23/05/22.
//

import UIKit
import AVFoundation
import CoreMotion

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toggleTorch(on: true);
    }
    
    let motion = CMMotionManager()
    // let timer = Timer


//    //func startAccelerometers() {
//       // Make sure the accelerometer hardware is available.
//       if self.motion.isAccelerometerAvailable {
//          self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
//          self.motion.startAccelerometerUpdates()
//
//          // Configure a timer to fetch the data.
//          self.timer = Timer(fire: Date(), interval: (1.0/60.0),
//                repeats: true, block: { (timer) in
//             // Get the accelerometer data.
//             if let data = self.motion.accelerometerData {
//                let x = data.acceleration.x
//                let y = data.acceleration.y
//                let z = data.acceleration.z
//
//                // Use the accelerometer data in your app.
//             }
//          })
//
//          // Add the timer to the current run loop.
//          RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
//       }
//    }

    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}

