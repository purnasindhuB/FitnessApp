//
//  BarChartView.swift
//  FitnessApp
//
/*
 MIT License

 Copyright (c) 2023 Fullstacktuts LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import UIKit

@IBDesignable
class BarGraphView: UIView {
    
    struct BarGraphData {
        
        var label: String
        
        var value: Int
        
    }
    
    @IBInspectable var barWidth: CGFloat = 20.0
    
    let barGraphData: [BarGraphData] = [BarGraphData(label: "Mon", value: 10),
                                        BarGraphData(label: "Tue", value: 7),
                                        BarGraphData(label: "Wed", value: 2),
                                        BarGraphData(label: "Thu", value: 15),
                                        BarGraphData(label: "Fri", value: 6)]
    
    let marginFactor: CGFloat = 0.1
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let margin: CGFloat = marginFactor * bounds.width
        
        let graphMidPoint = Int((bounds.height - (2 * margin)) / 2)
        
        //draw horizontal lines
        
        let linePath = UIBezierPath()
        
        linePath.lineWidth = 0.5
        
        linePath.move(to: CGPoint(x: 0, y: margin))
        
        linePath.addLine(to: CGPoint(x: bounds.width, y: margin))
        
        linePath.move(to: CGPoint(x: 0, y: CGFloat(graphMidPoint) + margin))
        
        linePath.addLine(to: CGPoint(x: bounds.width, y: CGFloat(graphMidPoint) + margin))
        
        linePath.move(to: CGPoint(x: 0, y: bounds.height - margin))
        
        linePath.addLine(to: CGPoint(x: bounds.width, y: bounds.height - margin))
        
        linePath.stroke()
        
        let numberOfBars: Int = barGraphData.count
        
        let numberOfGaps: Int = numberOfBars - 1
        
        let highestDataValue = (barGraphData.max { $0.value < $1.value })!.value
        
        let barGap: CGFloat = (bounds.width - (barWidth * CGFloat(numberOfBars)) - (margin * 2)) / CGFloat(numberOfGaps)
        
        let font = UIFont(name: "Avenir-Medium", size: 14)!
        
        //vertical labels
        
        let labelAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let verticalTopLabel = String(highestDataValue) as NSString
        
        verticalTopLabel.draw(at: CGPoint(x: 0, y: margin), withAttributes: labelAttributes)
        
        let midDataValue = Int(highestDataValue / 2)
        
        let verticalMidLabel = String(midDataValue) as NSString
        
        verticalMidLabel.draw(at: CGPoint(x: 0, y: CGFloat(graphMidPoint) + margin), withAttributes: labelAttributes)
        
        let verticalBottomLabel = String(0) as NSString
        
        verticalBottomLabel.draw(at: CGPoint(x: 0, y: bounds.height - margin), withAttributes: labelAttributes)
        
        for i in 0...barGraphData.count - 1 {
            
            let xPos = CGFloat(i) * (barWidth + barGap) + margin
            
            let barHeight: CGFloat = CGFloat(barGraphData[i].value) / CGFloat(highestDataValue) * (bounds.height - margin * 2)
            
            let yPos = bounds.height - barHeight - margin
            
            let bar = UIBezierPath(rect: CGRect(x: xPos, y: yPos, width: barWidth, height: barHeight))
            
            let barColor = UIColor(red: randomColorValue(), green: randomColorValue(), blue: randomColorValue(), alpha: 1.0)
            
            barColor.setFill()
            
            bar.fill()
            
            let label = barGraphData[i].label as NSString
            
            let textPos = CGPoint(x: xPos, y: bounds.height - margin)
            
            label.draw(at: textPos, withAttributes: labelAttributes)
            
        }
        
    }
    
    func randomColorValue() -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
        
    }
    

}
