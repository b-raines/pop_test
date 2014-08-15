class Circle < UIView
  def init
    super

    self.backgroundColor = UIColor.clearColor

    self
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()
    teal = UIColor.colorWithRed(0, green: 0.663, blue: 0.694, alpha: 1)

    CGContextSetLineWidth(context, 2)
    CGContextSetStrokeColorWithColor(context, teal.CGColor)
    rectangle = CGRectInset(rect, 3, 3)
    CGContextAddEllipseInRect(context, rectangle)
    CGContextStrokePath(context)
  end
end
