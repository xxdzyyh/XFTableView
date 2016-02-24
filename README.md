# XFTableView
尝试对tableview的使用进行优化

##registerNib优化
先使用registerNib注册xib文件，然后，直接使用dequeueReusableCellWithIdentifier获取的cell肯定不为空。但是这两个方法是在不同的位置执行的。
如果需要修改（如不再使用该cell），两个位置都需要修改。如果将这两个方法合二为一，就可以减少一些麻烦。
