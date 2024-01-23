import Foundation

class SimplePingChannel {
    private let channelName = "com.tomwyr.pinger/simplePing"
    private var runningExecutors: Array<SimplePingExecutor> = []
    
    func register(controller: FlutterViewController) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler(self.onMethodCall)
    }
    
    private func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "ping":
            let args = call.arguments as! Dictionary<String, Any>
            let executor = SimplePingExecutor(hostName: args["hostName"] as! String, packetSize: args["packetSize"] as! Int, timeout: args["timeout"] as! Int)
            runningExecutors.append(executor)
            executor.send(onSuccess: { (value) in
                self.dropExecutor(executor)
                result(value)
            }) { (error) in
                self.dropExecutor(executor)
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
    
    private func dropExecutor(_ executor: SimplePingExecutor) {
        if let index = runningExecutors.firstIndex(of: executor) {
            runningExecutors.remove(at: index)
        }
    }
}

class SimplePingExecutor: NSObject, SimplePingDelegate  {
    init(hostName: String, packetSize: Int, timeout: Int) {
        self.simplePing = SimplePing(hostName: hostName)
        self.packetSize = packetSize
        self.timeout = timeout
    }
    
    private let packetSize: Int
    private let timeout: Int
    private var simplePing: SimplePing
    private var onSuccess: ((Double) -> Void)? = nil
    private var onFailed: ((Error) -> Void)? = nil
    private var didSend: Bool = false
    private var sendTime: Date? = nil
    
    func send(onSuccess: @escaping (Double) -> Void, onFailed: @escaping (Error) -> Void) {
        if (!didSend) {
            didSend = true
            self.onSuccess = onSuccess
            self.onFailed = onFailed
            simplePing.delegate = self
            simplePing.start()
        }
    }
    
    func simplePing(_ pinger: SimplePing, didStartWithAddress address: Data) {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let data = String((0..<packetSize).map{ _ in letters.randomElement()! }).data(using: .ascii)
        simplePing.send(with: data, timeout: UInt16(timeout))
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
        let result = -sendTime!.timeIntervalSinceNow * 1000.0
        onSuccess?(result)
    }
    
    func simplePing(_ pinger: SimplePing, didSendPacket packet: Data, sequenceNumber: UInt16) {
        if (sendTime == nil) {
            sendTime = Date()
        }
    }
}

