class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.makeKeyAndVisible
    @window.backgroundColor = UIColor.whiteColor

    nav_cont = UINavigationController.alloc.initWithRootViewController(FirstController.new)
    @window.rootViewController = nav_cont
    true
  end
end
