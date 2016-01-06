#Distirbution Manage

这是一个基于状态机原理而编写的通知分发解耦Demo，核心是通过字符串对界面跳转、数据传递进行一个统一的管理，解决了通过PushViewController带来的耦合度过高的问题，以及添加了对GCD线程的封装（RMAsyncQueue）并使用了队列绑定,并对日期格式使用了单例模式，以及RMRMBaseCell中使用了动态绑定。

That is a distribution jump mechanism based on Objective-C,The mechanism use Notification push or pop,and it can solve high coulping, and unified manage what you want push or pop.
