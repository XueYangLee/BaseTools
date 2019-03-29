//
//  BasePushActionConfig.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#ifndef BasePushActionConfig_h
#define BasePushActionConfig_h



#define NaviRoutePushToVC(ViewController,beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
[nav pushViewController:ViewController animated:beAnimated];


#define NaviRoutePopVC(beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
[nav popViewControllerAnimated:beAnimated]



#define NaviRoutePopToRoot(beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
[nav popToRootViewControllerAnimated:beAnimated];



#define NaviRoutePopToVC(ViewController,beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
[nav popToViewController:ViewController animated:beAnimated];


#define NaviRoutePresentToVC(ViewController,beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
CATransition *transition = [CATransition animation];\
transition.duration = 0.35f;\
transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];\
transition.type = kCATransitionMoveIn;\
transition.subtype = kCATransitionFromTop;\
[nav.view.layer addAnimation:transition forKey:nil];\
[nav pushViewController:ViewController animated:NO];\


#define NaviRouteDismissToVC(beAnimated)\
UINavigationController *nav = [UINavigationController currentNavigationController];\
CATransition *transition = [CATransition animation];\
transition.duration = 0.35f;\
transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];\
transition.type = kCATransitionReveal;\
transition.subtype = kCATransitionFromBottom;\
[nav.view.layer addAnimation:transition forKey:nil];\
[nav popViewControllerAnimated:NO];\



#endif /* BasePushActionConfig_h */
