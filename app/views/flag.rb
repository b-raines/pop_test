class Flag < UIView
  def init
    super

    self.backgroundColor = UIColor.clearColor

    self
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()
    teal = UIColor.colorWithRed(0, green: 0.663, blue: 0.694, alpha: 1)

    CGContextMoveToPoint(context, 0, 0)
    CGContextAddLineToPoint(context, 30, 0)
    CGContextAddLineToPoint(context, 15, 27.5)
    CGContextAddLineToPoint(context, 30, 55)
    CGContextAddLineToPoint(context, 0, 55)
    CGContextAddLineToPoint(context, 0, 0)

    CGContextSetFillColorWithColor(context, teal.CGColor)
    CGContextFillPath(context)
  end
end
