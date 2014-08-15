class Line < UIView
  def init
    super

    self.backgroundColor = UIColor.clearColor

    self
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()
    teal = UIColor.colorWithRed(0, green: 0.663, blue: 0.694, alpha: 1)

    CGContextSetLineWidth(context, 1.25)
    CGContextSetStrokeColorWithColor(context, teal.CGColor)

    CGContextMoveToPoint(context, 0, rect.size.height / 2)
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height / 2)

    CGContextStrokePath(context)
  end
end
