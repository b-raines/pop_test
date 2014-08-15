class Banner < UIView
  def init
    super

    self.backgroundColor = UIColor.clearColor
    self.layer.masksToBounds = false

    self
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()
    teal = UIColor.colorWithRed(0, green: 0.663, blue: 0.694, alpha: 1)

    CGContextSetLineWidth(context, 1.5)
    CGContextSetStrokeColorWithColor(context, teal.CGColor)
    CGContextSetFillColorWithColor(context, teal.CGColor)

    CGContextMoveToPoint(context, 0, 0)
    CGContextAddLineToPoint(context, 240, 0)
    CGContextAddLineToPoint(context, 225, 27.5)
    CGContextAddLineToPoint(context, 240, 55)
    CGContextAddLineToPoint(context, 0, 55)
    CGContextAddLineToPoint(context, 0, 0)

    CGContextFillPath(context)
    CGContextStrokePath(context)
  end
end
