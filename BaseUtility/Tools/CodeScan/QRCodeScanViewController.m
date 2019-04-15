//
//  QRCodeScanViewController.m
//  PartScan
//
//  Created by 李雪阳 on 2017/12/12.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import "QRCodeScanViewController.h"
#import "AVCaptureVideoPreviewLayer+Helper.h"
#import "LXYQRCodeUtility.h"
#import "LXYQRCodeOverlayView.h"

@interface QRCodeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AVCaptureSession *qrSession;
@property (nonatomic, strong) AVCaptureDevice *captureDevice;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *QRVideoPreviewLayer;
@property (nonatomic, strong) UIImageView *line;
@property (nonatomic, strong) NSTimer *lineTimer;
@property (nonatomic, strong) UILabel *tipsLabel;
@property (nonatomic, strong) UIActivityIndicatorView *QRActivityIndicator;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation QRCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"二维码扫描";
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftButton setTitle:@"关闭" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(btnCloseClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [_rightButton setTitle:@"开灯" forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    _QRActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2.0, (SCREEN_HEIGHT - 164)  / 2.0, 100, 100)];
    _QRActivityIndicator.hidesWhenStopped = YES;
    _QRActivityIndicator.backgroundColor = [UIColor clearColor];
    [_QRActivityIndicator startAnimating];
    [self.view addSubview:_QRActivityIndicator];
    
    //权限受限
    if (![LXYQRCodeUtility canAccessAVCaptureDeviceForMediaType:AVMediaTypeVideo]) {
        [self showUnAuthorizedTips:YES];
    }
    
    //延迟加载，提高用户体验
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self displayScanView];
    });
}

- (void)displayScanView {
    //没权限显示权限受限
    if ([self loadCaptureUI]) {
        [self showUnAuthorizedTips:NO];
        [self setOverlayPickerView];
        [self startSYQRCodeReading];
    }
    else {
        [self showUnAuthorizedTips:YES];
    }
}

- (void)showUnAuthorizedTips:(BOOL)flag {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.frame = CGRectMake(8, 64, self.view.frame.size.width - 16, 300);
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.font = [UIFont systemFontOfSize:16];
        _tipsLabel.textColor = [UIColor blackColor];
        _tipsLabel.userInteractionEnabled = YES;
        NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
        if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
        _tipsLabel.text = [NSString stringWithFormat:@"请在%@的\"设置-隐私-相机\"选项中，\r允许%@访问你的相机。",[UIDevice currentDevice].model,appName];
        [self.view addSubview:_tipsLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleTipsTap)];
        [_tipsLabel addGestureRecognizer:tap];
    }
    
    _tipsLabel.hidden = !flag;
    [_QRActivityIndicator stopAnimating];
}

- (void)_handleTipsTap {
    [LXYQRCodeUtility openSystemSettings];
}

- (BOOL)loadCaptureUI {
    _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if (![_captureDevice hasTorch]) {
        [LXYQRCodeUtility showAlertWithTitle:@"提示" message:@"当前设备没有闪光灯"];
    }
    
    _QRVideoPreviewLayer = [AVCaptureVideoPreviewLayer captureVideoPreviewLayerWithFrame:self.view.bounds rectOfInterest:[LXYQRCodeUtility getReaderViewBoundsWithSize:CGSizeMake(kReaderViewWidth, kReaderViewHeight)] captureDevice:_captureDevice metadataObjectsDelegate:self];
    
    if (!_QRVideoPreviewLayer) {
        return NO;
    }
    _qrSession = _QRVideoPreviewLayer.session;
    
    return YES;
}

- (void)setOverlayPickerView {
    LXYQRCodeOverlayView *vOverlayer = [[LXYQRCodeOverlayView alloc] initWithFrame:self.view.bounds basedLayer:_QRVideoPreviewLayer];
    [self.view addSubview:vOverlayer];
    
    //添加过渡动画，类似微信
    [self.view.layer insertSublayer:_QRVideoPreviewLayer atIndex:0];
    [_QRVideoPreviewLayer addAnimation:[LXYQRCodeUtility zoomOutAnimation] forKey:nil];
}

- (void)gotoImagePickerController {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)turnOnTorch:(BOOL)on {
    if (_captureDevice) {
        [_captureDevice lockForConfiguration:nil];
        if (on) {
            [_captureDevice setTorchMode:AVCaptureTorchModeOn];
        }
        else {
            [_captureDevice setTorchMode: AVCaptureTorchModeOff];
        }
        
        [_captureDevice unlockForConfiguration];
    }
}

#pragma mark - Button Event

- (void)btnCloseClick:(UIButton *)sender {
    [self stopSYQRCodeReading];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnClick:(UIButton *)sender {
    //Touch
    if (sender.selected) {
        [self turnOnTorch:NO];
        [_rightButton setTitle:@"开灯" forState:UIControlStateNormal];
    }
    else {
        [self turnOnTorch:YES];
        [_rightButton setTitle:@"关灯" forState:UIControlStateNormal];
    }
    sender.selected = !sender.selected;
}

#pragma mark -AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    [self stopSYQRCodeReading];
    
    BOOL fail = YES;
    
    //扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *responseObj = metadataObjects[0];
        //        //org.iso.QRCode
        //        if ([responseObj.type containsString:@"QRCode"]) {
        //
        //        }
        if (responseObj) {
            NSString *strResponse = responseObj.stringValue;
            
            if (strResponse && ![strResponse isEqualToString:@""] && strResponse.length > 0) {
                DLog(@"qrcodestring==%@",strResponse);
                
                if ([strResponse hasPrefix:@"http"]) {
                    fail = NO;
                    AudioServicesPlaySystemSound(1360);
#pragma mark ----------扫描成功----------
                    
                }
            }
        }
    }
    
    if (fail) {
#pragma mark ----------扫描失败----------
    }
}

#pragma mark - startSYQRCodeReading

- (void)startSYQRCodeReading {
    [_QRActivityIndicator stopAnimating];
    
    if (!_line) {
        //画中间的基准线
        _line = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 300) / 2.0, kLineMinY, 300, 12 * 300 / 320.0)];
        [_line setImage:[UIImage imageNamed:@"QRCodeLine"]];
        [_QRVideoPreviewLayer addSublayer:_line.layer];
    }
    
    _lineTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 20 target:self selector:@selector(animationLine) userInfo:nil repeats:YES];
    [_qrSession startRunning];
    
    DLog(@"start reading");
}

- (void)stopSYQRCodeReading {
    [self turnOnTorch:NO];
    
    if (_lineTimer) {
        [_lineTimer invalidate];
        _lineTimer = nil;
    }
    
    if (_qrSession) {
        [_qrSession stopRunning];
        _qrSession = nil;
    }
    
    DLog(@"stop reading");
}

- (void)cancleSYQRCodeReading {
    [self stopSYQRCodeReading];
    
#pragma mark ----------取消扫描----------
    DLog(@"cancle reading");
}

#pragma mark - animationLine

- (void)animationLine {
    __block CGRect frame = _line.frame;
    
    static BOOL flag = YES;
    
    if (flag) {
        frame.origin.y = kLineMinY;
        flag = NO;
        
        [UIView animateWithDuration:1.0 / 20 animations:^{
            
            frame.origin.y += 5;
            _line.frame = frame;
            
        } completion:nil];
    }
    else {
        if (_line.frame.origin.y >= kLineMinY) {
            if (_line.frame.origin.y >= kLineMaxY - 12) {
                frame.origin.y = kLineMinY;
                _line.frame = frame;
                
                flag = YES;
            }
            else {
                [UIView animateWithDuration:1.0 / 20 animations:^{
                    frame.origin.y += 5;
                    _line.frame = frame;
                } completion:nil];
            }
        }
        else {
            flag = !flag;
        }
    }
    
    //DLog(@"_line.frame.origin.y==%f",_line.frame.origin.y);
}

- (void)dealloc {
    DLog(@"SYQRCodeViewController dealloc");
    [self stopSYQRCodeReading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
