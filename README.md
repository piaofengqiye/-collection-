# 简单的数字滚动
简单的数字滚动动画.今天写页面的时候需要写到这个动画, 就简单写了一个demo

![数字滚动](https://github.com/piaofengqiye/-collection-/blob/master/数字滚动.gif)

# 使用:
将```XLMultiDigitalAnimationView```文件拖拽到项目中即可

```
        //多数字
        //计算好视图的宽和高, 以及间隔, 个数
        let mostFrame = CGRect(x: 100, y: 200, width: 150, height: 40)
         mostView = XLMultiDigitalAnimationView(frame: mostFrame, backColor: .red, textColor: .white, itemSpace: 10, itemNum: 6)
        //每个item的圆角, 默认为0
        mostView.corners = 4
        view.addSubview(mostView)
        mostView.scroll(indexArray: [1, 2, 3, 4, 5, 6])
```
