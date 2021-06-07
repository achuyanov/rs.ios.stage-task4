import Foundation

public extension Int {
    
   var roman: String? {
        guard  self > 0 && self < 4000 else { return nil } 
	
		var ret = ""
        var num = self 
        let romanNums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        for i in 0..<13 {
            while num >= romanNums[i] {
                num -= romanNums[i] 
                ret.append(romanValues[i])
            }
        }
        //print (ret)
        return ret
    }
}
