//
//  SnakeHead.swift
//  gameSnake
//
//  Created by KKK on 15.03.2021.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        fillColor = .orange
        strokeColor = .orange
        
    self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        
    self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple | CollisionCategory.Snake
       
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
}
