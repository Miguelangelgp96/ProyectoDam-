//
//  ResponseReceived.swift
//  ProyectoDam
//
//  Created by Dam on 2/5/17.
//  Copyright © 2017 Dam. All rights reserved.
//

import Foundation

protocol ResponseReceiver {
    func onDataReceived (data : Data)
    func onErrorReceivingData (message: String)
}
