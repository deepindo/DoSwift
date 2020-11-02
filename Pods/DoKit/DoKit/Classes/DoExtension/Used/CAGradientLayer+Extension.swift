//
//  CAGradientLayer+Extension.swift
//  MCHT
//
//  Created by mac on 2019/12/13.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation

extension CAGradientLayer {
    
    //获取普通渐变层
    public func customerLayer() -> CAGradientLayer {
        //定义渐变的颜色（7种彩虹色）
        let gradientColors = [hexColor(0xFA8410).cgColor,
                              hexColor(0xFB6A37).cgColor,
                              UIColor.yellow.cgColor,
                              UIColor.green.cgColor,
                              UIColor.cyan.cgColor,
                              UIColor.blue.cgColor,
                              UIColor.purple.cgColor]
         
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
         
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
         
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
         
        return self
    }
    
    //获取彩虹渐变层
    public func rainbowLayer() -> CAGradientLayer {
        //定义渐变的颜色（7种彩虹色）
        let gradientColors = [UIColor.red.cgColor,
                              UIColor.orange.cgColor,
                              UIColor.yellow.cgColor,
                              UIColor.green.cgColor,
                              UIColor.cyan.cgColor,
                              UIColor.blue.cgColor,
                              UIColor.purple.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        
        return self
    }
}
