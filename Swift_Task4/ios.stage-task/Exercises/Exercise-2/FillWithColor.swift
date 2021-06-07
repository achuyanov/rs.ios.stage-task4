import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {    

        if image.isEmpty { return image }

        let m = image.count
        let n = image[0].count

        if (m < 0 || n < 0 || m > 50 || n > 50 ||
            newColor < 0 || newColor > 65535 ||
            row < 0 || row >= m ||
            column < 0 || column >= n || 
            image[row][column] == newColor) { return image } 
            
        let oldColor = image[row][column]
        var ret = image
        ret[row][column] = newColor
        
        if (row - 1 >= 0 && image[row - 1][column] == oldColor) {
            ret = fillWithColor(ret, row - 1, column, newColor)
        }

        if (row + 1 < m && image[row + 1][column] == oldColor) {
            ret = fillWithColor(ret, row + 1, column, newColor)
        }

        if (column - 1 >= 0 && image[row][column - 1] == oldColor) {
            ret = fillWithColor(ret, row, column - 1, newColor)
        }
        
        if (column + 1 < n && image[row][column + 1] == oldColor) {
            ret = fillWithColor(ret, row, column + 1, newColor)
        }
        
        return ret
            
    }
}

// print (fillWithColor([[0, 0, 0], [0, 0, 0]], 0,  0, 10 ))
// print (fillWithColor([[1, 1, 1], [0, 1, 0], [1, 1, 1]], 5,  5, 10 ))

/*
**`m == image.length`**  
**`n == image[i].length`**  
**`1 <= m, n <= 50`**  
**`0 <= image[i][j], newColor < 65536`**  
**`0 <= row <= m`**  
**`0 <= column <= n`**  
*/

/*
## Example 2
**Input: image = [[0, 0, 0], [0, 0, 0]], row = 0, column = 0, newColor = 10**
**Output: [[10, 10, 10], [10, 10, 10]]**
## Example 3
**Input: image = [[1, 1, 1], [0, 1, 0], [1, 1, 1]], row = 5, column = 5, newColor = 10**
**Output: [[1, 1, 1], [0, 1, 0], [1, 1, 1]]**
*/
