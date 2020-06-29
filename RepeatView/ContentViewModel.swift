//
//  ContentViewModel.swift
//  RepeatView
//
//  Created by pook on 6/28/20.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    private var repeatViewTimer: DispatchSourceTimer? = nil
    @Published var list: [String?] = []
    
    func start() {
        let source = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        source.setEventHandler(handler: {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.list.insert(UIPasteboard.general.string, at: 0)
            }
        })
        source.schedule(deadline: .now(), repeating: 1.0, leeway: .nanoseconds(0))
        source.resume()
        repeatViewTimer = source
    }
    
    func stop() {
        repeatViewTimer?.cancel()
        repeatViewTimer = nil
    }
}
