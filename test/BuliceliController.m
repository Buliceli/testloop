//
//  BuliceliController.m
//  test
//
//  Created by 李洞洞 on 22/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "BuliceliController.h"

@interface BuliceliController ()

@end

@implementation BuliceliController
/*
 <select name="school" id="school" style="WIDTH:198px" onchange="javascript:selectSchool(this.value);">
 <option value="-1">--请选择学校--</option>
 <option value="南京市六合区双语小学雄州分校">南京市六合区双语小学雄州分校</option>
 <option value="南京市六合区棠城学校">南京市六合区棠城学校</option>
 <option value="南京市金陵中学龙湖分校">南京市金陵中学龙湖分校</option>
 <option value="南京市六合区马鞍镇汪洋教学点">南京市六合区马鞍镇汪洋教学点</option>
 <option value="南京市六合区仕金学校">南京市六合区仕金学校</option>
 <option value="南京市六合区马鞍镇盛岗教学点">南京市六合区马鞍镇盛岗教学点</option>
 <option value="六合区马集镇黄岗小学">六合区马集镇黄岗小学</option>
 <option value="六合区竹镇镇乌石希望小学">六合区竹镇镇乌石希望小学</option>
 <option value="六合区冶山镇东王小学">六合区冶山镇东王小学</option>
 <option value="南京市六合区樊集小学">南京市六合区樊集小学</option>
 <option value="六合区龙袍镇邵东小学">六合区龙袍镇邵东小学</option>
 <option value="南京市六合区瓜埠镇贾裴小学">南京市六合区瓜埠镇贾裴小学</option>
 <option value="南京市六合区马鞍镇城西小学">南京市六合区马鞍镇城西小学</option>
 <option value="六合区马鞍街道大圣小学">六合区马鞍街道大圣小学</option>
 <option value="南京竹镇中日友好希望小学">南京竹镇中日友好希望小学</option>
 <option value="南京市六合区竹程小学">南京市六合区竹程小学</option>
 <option value="南京市六合区龙池小学">南京市六合区龙池小学</option>
 <option value="南京市六合区冶山铁矿学校">南京市六合区冶山铁矿学校</option>
 <option value="南京市六合区长山小学">南京市六合区长山小学</option>
 <option value="南京市六合区横梁街道明德小学">南京市六合区横梁街道明德小学</option>
 <option value="南京市六合区广益小学">南京市六合区广益小学</option>
 <option value="南京市六合区方山小学">南京市六合区方山小学</option>
 <option value="六合区龙袍镇新桥小学">六合区龙袍镇新桥小学</option>
 <option value="南京市六合区马鞍小学">南京市六合区马鞍小学</option>
 <option value="南京市六合区瓜埠镇红光小学">南京市六合区瓜埠镇红光小学</option>
 <option value="南京市六合区东沟镇平原小学">南京市六合区东沟镇平原小学</option>
 <option value="南京市六合区玉带滨江小学">南京市六合区玉带滨江小学</option>
 <option value="六合区马鞍街道中心小学">六合区马鞍街道中心小学</option>
 <option value="六合区冶山镇中心小学">六合区冶山镇中心小学</option>
 <option value="南京市六合区龙池中心小学">南京市六合区龙池中心小学</option>
 <option value="南京市六合区竹镇镇民族小学">南京市六合区竹镇镇民族小学</option>
 <option value="南京市六合区程桥中心小学">南京市六合区程桥中心小学</option>
 <option value="南京市六合区金牛湖中心小学">南京市六合区金牛湖中心小学</option>
 <option value="南京市六合区横梁中心小学">南京市六合区横梁中心小学</option>
 <option value="南京市六合区新篁镇中心小学">南京市六合区新篁镇中心小学</option>
 <option value="南京市六合区灵岩小学">南京市六合区灵岩小学</option>
 <option value="南京市六合区玉带中心小学">南京市六合区玉带中心小学</option>
 <option value="南京市六合区东沟镇中心小学">南京市六合区东沟镇中心小学</option>
 <option value="南京市六合区实验小学">南京市六合区实验小学</option>
 <option value="南京市六合区特殊教育学校">南京市六合区特殊教育学校</option>
 <option value="南京市六合双语小学">南京市六合双语小学</option>
 <option value="南京市六合区瓜埠镇中心小学">南京市六合区瓜埠镇中心小学</option>
 <option value="六合区龙袍镇中心小学">六合区龙袍镇中心小学</option>
 <option value="南京市六合区城西初级中学">南京市六合区城西初级中学</option>
 <option value="南京市六合区竹程初级中学">南京市六合区竹程初级中学</option>
 <option value="南京市六合区竹镇镇乌石初级中学">南京市六合区竹镇镇乌石初级中学</option>
 <option value="六合区马鞍初级中学">六合区马鞍初级中学</option>
 <option value="六合区马集初级中学">六合区马集初级中学</option>
 <option value="六合区竹镇民族中学">六合区竹镇民族中学</option>
 <option value="南京市程桥初级中学">南京市程桥初级中学</option>
 <option value="南京市六合区新集初级中学">南京市六合区新集初级中学</option>
 <option value="六合区冶山初级中学">六合区冶山初级中学</option>
 <option value="南京市六合区金牛湖初级中学">南京市六合区金牛湖初级中学</option>
 <option value="南京市横梁初级中学">南京市横梁初级中学</option>
 <option value="南京市龙袍镇初级中学">南京市龙袍镇初级中学</option>
 <option value="南京市玉带初级中学">南京市玉带初级中学</option>
 <option value="南京市六合区瓜埠初级中学">南京市六合区瓜埠初级中学</option>
 <option value="六合区龙池初级中学">六合区龙池初级中学</option>
 <option value="南京市六合区雄州初级中学">南京市六合区雄州初级中学</option>
 <option value="南京市仕金学校初级中学">南京市仕金学校初级中学</option>
 <option value="南京市六合区励志学校">南京市六合区励志学校</option>
 <option value="南京市六合区东沟初级中学">南京市六合区东沟初级中学</option>
 <option value="南京市新篁初级中学">南京市新篁初级中学</option>
 <option value="南京市六合区实验初级中学">南京市六合区实验初级中学</option>
 </select>
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSString * htmlStr = [NSString stringWithContentsOfFile:str encoding:NSUTF8StringEncoding error:nil];
    NSArray * arr = [htmlStr componentsSeparatedByString:@"<select name=\"school\" id=\"school\""];
    
    NSString * lastStr = arr.lastObject;
    NSArray * twoArr = [lastStr componentsSeparatedByString:@"</option></select>"];
    NSString * twoStr = twoArr.firstObject;
    
    NSArray * threeArr = [twoStr componentsSeparatedByString:@"--请选择学校--"];
    //NSLog(@"%@",threeArr.lastObject);
    NSString * string = threeArr.lastObject;
    NSArray * arrr =  [string componentsSeparatedByString:@"<option value="];
    //NSLog(@"%@",arrr);
    NSMutableArray * lddarr = [NSMutableArray array];
    for (NSString * str in arrr) {
       NSArray * a = [str componentsSeparatedByString:@">"];
        NSString * s = a.firstObject;
        NSString * newStr = [NSString stringWithFormat:@"\"schoolName\":%@",s];
        NSString * nnn = [NSString stringWithFormat:@"{%@}",newStr];
        [lddarr addObject:nnn];
    }
    NSLog(@"%@",lddarr);
}

@end
