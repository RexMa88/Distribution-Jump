#Distirbution Manage

这是一个基于状态机以及响应式编程而编写的通知分发解耦Demo，核心是通过“信号”的方式对界面跳转、数据传递进行一个统一的管理，信号传递逻辑以及使用方法集中在Appdelegate,RMTableViewDelegate中，解决了通过Push、Pop带来的耦合度过高的问题，增加了灵活性，利用该机制可以通过服务器传递数据灵活配置跳转界面，并且通过独立的Delegate、DataSource对庞大的Controller进行解耦，以及添加了对GCD线程的封装（RMAsyncQueue）并使用了队列绑定,并对日期格式使用了单例模式，以及RMRMBaseCell中使用了动态绑定。在pch中添加了安全线程宏,该项目将持续维护。

* 信号逻辑：Appdelegate
* 信号宏：KNotificationAction,pch

由于我本人比较喜欢喝咖啡，所以在这个简单的信号机制上添加了高德地图SDK，除了用于定位以外，还具备服务搜索功能，以后也会基于此添加更多的功能。


**UPDATE**

* 添加了无网络状态时的数据缓存，主要针对无网络状态。
* 由于天气成为了我出门的障碍，便对之前看起来很弱鸡的Project进行了重构，添加了天气预报，并且使用了ReactiveCocoa，真正的函数式，响应式编程。

That is a distribution jump mechanism based on Objective-C,The mechanism use Notification push or pop,and it can solve high coulping, and unified manage what you want push or pop.
