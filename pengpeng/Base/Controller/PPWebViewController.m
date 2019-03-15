//
//  PPWebViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPWebViewController.h"
#import <WebKit/WebKit.h>

@interface WeakWebViewScriptMessageDelegate : NSObject <WKScriptMessageHandler>
//WKScriptMessageHandler 这个协议类专门用来处理JavaScript调用原生OC的方法
@property (nonatomic,weak) id<WKScriptMessageHandler> scriptDelegate;
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;
@end
@implementation WeakWebViewScriptMessageDelegate
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

#pragma mark - WKScriptMessageHandler
//遵循WKScriptMessageHandler协议，必须实现如下方法，然后把方法向外传递
//通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    if ([self.scriptDelegate respondsToSelector:@selector(userContentController:didReceiveScriptMessage:)]) {
        [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
    }
}

@end


@interface PPWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic, strong)WKWebView *webView;
@property (nonatomic, strong)UIProgressView *progressView;

@end

@implementation PPWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webview =[[WKWebView alloc]initWithFrame:CGRectMake(0, NavBarHight, kScreenw, kScreenH - NavBarHight)];
    self.webView = webview;
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
   
    webview.navigationDelegate = self;
    [self.view addSubview:webview];
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, NavBarHight, kScreenw, 2)];
    self.progressView.progressTintColor = [UIColor greenColor];
    [self.view addSubview:self.progressView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"estimatedProgress"] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        if (self.webView.estimatedProgress  >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
//通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    //用message.body 获得JS传出的参数体
    NSString *parameter = message.body;
    //JS调用OC
    if ([message.name isEqualToString:@"iosTel"]) {
        if (!kStringIsEmpty(parameter)) {
            [self callAction:parameter];
        }
    }else if ([message.name isEqualToString:@"openMoneyUI"]) {
        //跳转钱包
    }
}
-(void)callAction:(NSString *)phone{
    
    NSString *str=[[NSString alloc] initWithFormat:@"telprompt:%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    
#pragma mark - 这里判断是否是联系我们
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addAllScriptMsgHandle];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeAllScriptMsgHandle];
}

-(void)removeAllScriptMsgHandle {
    WKUserContentController *controller = self.webView.configuration.userContentController;
    [controller removeScriptMessageHandlerForName:@"iosTel"];
    [controller removeScriptMessageHandlerForName:@"openMoneyUI"];
}

-(void)addAllScriptMsgHandle {
    WKUserContentController *controller = self.webView.configuration.userContentController;
    [controller addScriptMessageHandler:self  name:@"iosTel"];
    [controller addScriptMessageHandler:self name:@"openMoneyUI"];
}

- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView setNavigationDelegate:nil];
    [self.webView setUIDelegate:nil];
}


@end
