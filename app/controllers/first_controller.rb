class FirstController < UIViewController
  def loadView
    self.view = (@main_view = UIView.new)
    self.view.frame = [[0, 0], [rmq.device.width, rmq.device.height]]

    self.view.addSubview(@square = Square.new)
    @square.frame = [[50, 200], [25, 55]]

    self.view.addSubview(@circle = Circle.new)
    @circle.frame = [[17, 215], [25, 25]]

    self.view.insertSubview(@line = Line.new, belowSubview: @square)
    line_width = CGRectGetMinX(@square.frame) - CGRectGetMaxX(@circle.frame) + 4
    @line.frame = [[CGRectGetMaxX(@circle.frame) - 4, CGRectGetMinY(@square.frame)], [line_width, @square.frame.size.height]]

    self.view.addSubview(@banner_image = UIImageView.new)
    @banner_image.frame = [[-120, 100], [0, 0]]
    @banner_image.image = rmq.image.resource('award_flag_day_zero')
    @banner_image.sizeToFit
    @banner_image.userInteractionEnabled = true
    @banner_image.layer.anchorPoint = CGPointMake(0.037, 0.5)

    @toggle = true
  end

  def viewDidLoad
    rmq(@square).on(:tap) do |sender, event|
      add_stretch_animation_to_view(@square)
      add_x_pos_animation_to_view(@square.flag)
      add_shrink_animation_to_view(@square.rollup)
      add_x_pos_animation_to_text(@square.title)
      @toggle = !@toggle
    end

    rmq(@banner_image).on(:tap) do |sender, event|
      add_tollbooth_animation_to_view(@banner_image)
      @toggle = !@toggle
    end
  end

  def add_tollbooth_animation_to_view(view)
    anim = POPSpringAnimation.animationWithPropertyNamed(KPOPLayerRotation)
    anim_two = POPBasicAnimation.animationWithPropertyNamed(KPOPLayerPosition)
    if @toggle
      anim.toValue =  0
      anim_two.toValue = NSValue.valueWithCGRect(CGRectMake(50, 122.5, 0, 0))
    else
      anim.toValue = -90 * Math::PI / 180
      anim_two.toValue = NSValue.valueWithCGRect(CGRectMake(30, 100, 0, 0))
    end
    anim.springBounciness = 20
    anim_two.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionLinear)
    anim_two.duration = 0.17

    view.layer.pop_addAnimation(anim, forKey: 'pop_tollbooth')
    # view.layer.pop_addAnimation(anim_two, forKey: 'pop_tollbooth_move')
  end

  def add_stretch_animation_to_view(view)
    anim = POPBasicAnimation.animationWithPropertyNamed(KPOPViewFrame)
    if @toggle
      anim.toValue = NSValue.valueWithCGRect([[view.frame.origin.x, view.frame.origin.y], [240, 55]])
    else
      anim.toValue = NSValue.valueWithCGRect(CGRectMake(50, 200, 25, 55))
    end
    anim.duration = 0.6
    anim.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    view.pop_addAnimation(anim, forKey: 'pop_stretch')
  end

  def add_x_pos_animation_to_view(view)
    anim = POPBasicAnimation.animationWithPropertyNamed(KPOPLayerPositionX)
    if @toggle
      anim.toValue = 250
    else
      anim.toValue = 40
    end
    anim.duration = 0.6
    anim.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    view.pop_addAnimation(anim, forKey: 'pop_x_pos')
  end

  def add_x_pos_animation_to_text(view)
    anim = POPBasicAnimation.animationWithPropertyNamed(KPOPLayerPositionX)
    if @toggle
      anim.toValue = 120
    else
      anim.toValue = -90
    end
    anim.duration = 0.6
    anim.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    view.pop_addAnimation(anim, forKey: 'pop_x_pos')
  end

  def add_shrink_animation_to_view(view)
    anim = POPBasicAnimation.animationWithPropertyNamed(KPOPViewFrame)
    if @toggle
      anim.toValue = NSValue.valueWithCGRect([[view.frame.origin.x + 2, view.frame.origin.y], [0, 57]])
    else
      anim.toValue = NSValue.valueWithCGRect(CGRectMake(-3, -1, 30, 57))
    end
    anim.duration = 0.6
    anim.timingFunction = CAMediaTimingFunction.functionWithName(KCAMediaTimingFunctionEaseInEaseOut)
    view.pop_addAnimation(anim, forKey: 'pop_shrink')
  end
end
