//
//  DoScanVC.swift
//  SalaryManagement
//
//  Created by deepindo on 2020/9/29.
//

import UIKit
import AVFoundation
import AudioToolbox
import AssetsLibrary
import Photos

import DoKit

//MARK: protocol
protocol DoScanVCDelegate: class {
//    func agentDeviceCellActionButtonClicked(_ cell: AgentDeviceCell)
}

//MARK: option protocol
extension DoScanVCDelegate {
//    func agentDeviceCellActionButtonClicked(_ cell: AgentDeviceCell) {}
}

enum DoScanError: String, Error {
    case empty
}

class DoScanVC: DoVC {
    
    open weak var delegate: DoScanVCDelegate?
    
    open var finished: ((Result<String, DoScanError>) -> Void)?
    
    /// 设备
    private let device = AVCaptureDevice.default(for: .video)
    
    /// 输入流
    private var input: AVCaptureDeviceInput?
    
    
    
    
//    var line_tag = 0
//    var highlightView = UIView()
//    var session = AVCaptureSession() /// 输入输出的中间桥梁

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        session.startRunning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigation()
//        instanceDevice()
        
        createCaptureDevice()
        
        let scanView = DoScanView(frame: view.bounds)
        view.insertSubview(scanView, belowSubview: customTopBar)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
//        self.navigationController.navigationBarHidden = true;
//        [session removeObserver:self forKeyPath:@"running" context:nil];
    }
    
    func customNavigation() {
        
        customTopBar.backgroundColor = UIColor.clear
        isHiddenBackBtn = false
        customTitle = "扫一扫"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        session.stopRunning()
    }
    
    func createCaptureDevice() {
        
        /// 判断权限，后面加上
//        if !canmeraAvailable() {
//            return
//        }
        
        guard let device = self.device else {
            return
        }
        do {
            input = try AVCaptureDeviceInput(device: device)
            
            if session.canAddInput(input!) {
                session.addInput(input!)
            }
            if session.canAddOutput(output) {
                session.addOutput(output)
                output.metadataObjectTypes = [.qr,.ean13,.ean8,.code128]
            }
            
            view.layer.insertSublayer(preview, at: 0)
            
        } catch {
            DDLog(error)
        }
    }
    
    /// 配置相机属性
//    func instanceDevice() {
//
//        line_tag = 1872637
//
//        /// 获取摄像设备
//        let device = AVCaptureDevice.default(for: .video)
//
//        /// 创建输入流
////        do {
//            let input = try? AVCaptureDeviceInput.init(device: device!)
////        } catch {
////            print("AVCaptureDeviceInput error")
////        }
//
//        /// 创建输出流
//        let output = AVCaptureMetadataOutput()
//
//        /// 设置代理 在主线程里刷新
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//
//        /// 初始化链接对象
//        session = AVCaptureSession()
//
//        /// 高质量采集率
//        session.canSetSessionPreset(.high)
//
//        if input != nil {
//            session.addInput(input!)
//        }
//
//        if output != nil {
//            session.addOutput(output)
//
//            /// 设置扫码支持的编码格式(如下设置条形码和二维码兼容)
//            var availaArr = [AVMetadataObject.ObjectType]()
//            if output.availableMetadataObjectTypes.contains(.qr) {
//                availaArr.append(AVMetadataObject.ObjectType.qr)
//            }
//            if output.availableMetadataObjectTypes.contains(.ean13) {
//                availaArr.append(AVMetadataObject.ObjectType.ean13)
//            }
//            if output.availableMetadataObjectTypes.contains(.ean8) {
//                availaArr.append(AVMetadataObject.ObjectType.ean8)
//            }
//            if output.availableMetadataObjectTypes.contains(.code128) {
//                availaArr.append(AVMetadataObject.ObjectType.code128)
//            }
//
//            output.metadataObjectTypes = availaArr
//        }
//
//        let layer = AVCaptureVideoPreviewLayer(session: session)
//        layer.videoGravity = .resizeAspectFill
//        layer.frame = view.layer.bounds
//        view.layer.insertSublayer(layer, at: 0)
//
//        ///
////        [self setOverlayPickerView];
//
//        session.addObserver(self, forKeyPath: "running", options: .new, context: nil)
//
//
//        /// 开始捕获
//        session.startRunning()
//    }

    
    /// 监听扫码状态-修改扫描动画
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
//        if ([object isKindOfClass:[AVCaptureSession class]]) {
//            BOOL isRunning = ((AVCaptureSession *)object).isRunning;
//            if (isRunning) {
//                [self addAnimation];
//            }else{
//                [self removeAnimation];
//            }
//        }
    }
 
    /// 添加扫码动画
    func addAnimation() {
        
    }
    
//    - (void)addAnimation{
//        UIView *line = [self.view viewWithTag:line_tag];
//        line.hidden = NO;
//        CABasicAnimation *animation = [ScanViewController moveYTime:2 fromY:[NSNumber numberWithFloat:0] toY:[NSNumber numberWithFloat:ScreenWidth-100-2] rep:OPEN_MAX];
//        [line.layer addAnimation:animation forKey:@"LineAnimation"];
//    }
//
//    + (CABasicAnimation *)moveYTime:(float)time fromY:(NSNumber *)fromY toY:(NSNumber *)toY rep:(int)rep
//    {
//        CABasicAnimation *animationMove = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
//        [animationMove setFromValue:fromY];
//        [animationMove setToValue:toY];
//        animationMove.duration = time;
//    //    animationMove.delegate = self;
//        animationMove.repeatCount  = rep;
//        animationMove.fillMode = kCAFillModeForwards;
//        animationMove.removedOnCompletion = NO;
//        animationMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        return animationMove;
//    }
//
//
//    /**
//     *  @author Whde
//     *
//     *  去除扫码动画
//     */
//    - (void)removeAnimation{
//        UIView *line = [self.view viewWithTag:line_tag];
//        [line.layer removeAnimationForKey:@"LineAnimation"];
//        line.hidden = YES;
//    }
//
//    - (void)cancleBtnClick
//    {
//        [self.navigationController popViewControllerAnimated:YES];
//    //     [self dismissViewControllerAnimated:YES completion:nil];
//    }

    /// 输出流
    private  lazy var output: AVCaptureMetadataOutput =  {
        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.rectOfInterest = UIScreen.main.bounds
        return output
    }()
    
    /// 链接对象
    private lazy var session:AVCaptureSession =  {
        let session = AVCaptureSession()
        session.sessionPreset = .inputPriority
        return session
    }()
    
    /// 预览layer
    private lazy var preview: AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = UIScreen.main.bounds
        return preview
    }()
}

extension DoScanVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count == 0 { return }
        session.stopRunning()
        
        if let metadataObject = (metadataObjects.first as? AVMetadataMachineReadableCodeObject)  {
            if let string = metadataObject.stringValue, string.count > 0 {
                DDLog(string)
                finished?(.success(string))
                navigationController?.popViewController(animated: true)
            } else {
                finished?(.failure(.empty))
                navigationController?.popViewController(animated: true)
            }
        }
    }
}


extension DoScanVC: CAAnimationDelegate {
    
}


class DoScanView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let hSpace: CGFloat = 64
        let scanW = frame.size.width - hSpace * 2
        let scanMinX = hSpace
        let scanMaxX = hSpace + scanW
        let scanMinY = center.y - scanW / 2
        let scanMaxY = center.y + scanW / 2
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        context?.setLineJoin(.round)
        context?.setLineWidth(4.0)
        //context?.setStrokeColor(UIColor.orange.cgColor)
        context?.setStrokeColor(hexColor(0x1C90FF).cgColor)
        context?.beginPath()
        
        // left top
        context?.move(to: CGPoint(x: scanMinX + 10, y: scanMinY))
        context?.addLine(to: CGPoint(x: scanMinX, y: scanMinY))
        context?.addLine(to: CGPoint(x: scanMinX, y: scanMinY + 10))
        
        // right top
        context?.move(to: CGPoint(x: scanMaxX - 10, y: scanMinY))
        context?.addLine(to: CGPoint(x: scanMaxX, y: scanMinY))
        context?.addLine(to: CGPoint(x: scanMaxX, y: scanMinY + 10))
        
        
        // left bottom
        context?.move(to: CGPoint(x: scanMinX, y: scanMaxY - 10))
        context?.addLine(to: CGPoint(x: scanMinX, y: scanMaxY))
        context?.addLine(to: CGPoint(x: scanMinX + 10, y: scanMaxY))
        
        // right bottom
        context?.move(to: CGPoint(x: scanMaxX - 10, y: scanMaxY))
        context?.addLine(to: CGPoint(x: scanMaxX, y: scanMaxY))
        context?.addLine(to: CGPoint(x: scanMaxX, y: scanMaxY - 10))
        
        context?.strokePath()
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        let hSpace: CGFloat = 64
        let scanW = frame.size.width - hSpace * 2
        let scanMinX = hSpace
        let scanMinY = center.y - scanW / 2

        //line
        let layer  = CAGradientLayer()
        let color = hexColor(0x1C90FF)//UIColor.orange
        layer.colors = [color.withAlphaComponent(0).cgColor,
                        color.withAlphaComponent(0.9).cgColor,
                        color.withAlphaComponent(0).cgColor]
        layer.locations = [0,0.5,1]
        layer.startPoint = CGPoint(x:0.5,y: 0)
        layer.endPoint = CGPoint(x: 0.5,y: 1)
        layer.cornerRadius = 2
        layer.masksToBounds = true
        let frame = CGRect(x: scanMinX + 8, y: scanMinY, width: scanW - 16, height: 4)
        layer.frame = frame
        self.layer.addSublayer(layer)
        
        let label = UILabel()
        label.font = kCustomFont(14)
        label.textAlignment = .center
        label.text = "将二维码/条形码放入框内，即可以自动扫描"
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.frame = CGRect(x: scanMinX-20, y: scanMinY + scanW + 30, width: scanW+40, height: 20)
        self.addSubview(label)
        
        //animation
        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.fromValue = 0
        animation.toValue = scanW - 8
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode =  CAMediaTimingFillMode.both
        layer.add(animation, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
