import Foundation

class SimplePingChannel {
    private let channelName = "com.tomwyr.pinger/simplePing"
    
    func register(controller: FlutterViewController) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler(self.onMethodCall)
    }
    
    private func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "ping":
            let args = call.arguments as! Dictionary<String, Any>
            let executor = SimplePingExecutor(hostName: args["hostName"] as! String, packetSize: args["packetSize"] as! Int)
            executor.send(onSuccess: { (value) in
                result(value)
            }) { (error) in
                result(FlutterError(
                    code: "SimplePing#ping",
                    message: error.localizedDescription,
                    details: nil
                ))
            }
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

class SimplePingExecutor: NSObject, SimplePingDelegate  {
    init(hostName: String, packetSize: Int) {
        self.simplePing = SimplePing(hostName: hostName)
        self.packetSize = packetSize
    }
    
    private let packetSize: Int
    private var simplePing: SimplePing
    private var onSuccess: ((Double) -> Void)? = nil
    private var onFailed: ((Error) -> Void)? = nil
    private var didSend: Bool = false
    private var start: Date? = nil
    
    func send(onSuccess: @escaping (Double) -> Void, onFailed: @escaping (Error) -> Void) {
        if (!didSend) {
            didSend = true
            self.onSuccess = onSuccess
            self.onFailed = onFailed
            simplePing.start()
        }
    }
    
    func simplePing(_ pinger: SimplePing, didStartWithAddress address: Data) {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let data = String((0..<packetSize).map{ _ in letters.randomElement()! }).data(using: .ascii)
        simplePing.send(with: data)
        start = Date()
    }
    
    func simplePing(_ pinger: SimplePing, didFailWithError error: Error) {
        simplePing.stop()
        onFailed?(error)
    }
    
    func simplePing(_ pinger: SimplePing, didFailToSendPacket packet: Data, sequenceNumber: UInt16, error: Error) {
        simplePing.stop()
        onFailed?(error)
    }
    
    func simplePing(_ pinger: SimplePing, didReceivePingResponsePacket packet: Data, sequenceNumber: UInt16) {
        simplePing.stop()
        let result = start!.timeIntervalSinceNow * 1000.0
        onSuccess?(result)
    }
}

