class Square < UIView
  attr_reader :flag, :rollup, :title

  def init
    super

    self.backgroundColor = UIColor.clearColor

    self.addSubview(@flag = Flag.new)
    @flag.frame = [[25, 0], [30, 55]]

    self.addSubview(@title = UILabel.new)
    @title.text = 'Course begins tomorrow!'
    @title.textColor = UIColor.whiteColor
    @title.frame = [[-200, 10], [200, 20]]

    self.addSubview(@rollup = UIView.new)
    @rollup.frame = [[-3, -1], [30, 57]]
    @rollup.backgroundColor = UIColor.colorWithRed(0, green: 0.613, blue: 0.644, alpha: 1)
    @rollup.layer.cornerRadius = 3

    self
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext()
    teal = UIColor.colorWithRed(0, green: 0.663, blue: 0.694, alpha: 1)

    CGContextMoveToPoint(context, 0, 0)
    CGContextAddLineToPoint(context, 55, 0)
    CGContextAddLineToPoint(context, 55, 55)
    CGContextAddLineToPoint(context, 0, 55)
    CGContextAddLineToPoint(context, 0, 0)

    CGContextSetFillColorWithColor(context, teal.CGColor)
    CGContextFillPath(context)
  end
end
