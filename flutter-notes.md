# 我的 Flutter 学习笔记

## 环境
* 下载并安装 flutter SDK，将 bin 目录加入path
改依赖源否则请自行翻墙
`export PUB_HOSTED_URL=https://pub.flutter-io.cn`
`export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn`

## 常用命令
* `flutter doctor ` 检查flutter的工具链环境
* `flutter format <file name>` 格式化 某一个 flutter 源文件
* `flutter packages get` 获取 pubspec.yaml 中定义的flutter 依赖库
* `flutter upgrade` 升级 flutter sdk

## 一些小 tips
* main 函数使用了 `(=>)` 符号, 这是Dart中单行函数或方法的简写。
* 该应用程序继承了 `StatelessWidget` ，这将会使应用本身也成为一个 widget。 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)
* Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂。
* widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己。

## 一些依赖
* flutter_native_image
这个 package 通过调用平台通道的方式来压缩图片，压缩图片效率超高，不到一秒就压缩完。同时图片质量可以自己调控。
``` yaml
flutter_native_image:
  git: https://github.com/btastic/flutter_native_image.git
```

压缩图片
```dart
File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: quality, percentage: percentage);
```
* local_notifications
这个 package 可以让 app 在任务栏显示通知
* transparent_image
这个 package 可以更优雅的显示图片
* font_awesome_flutter
丰富的图标 package，可以在 font awesome 官网上找到图标的名字
* image_picker
从相册中或相机中获取图片
* url_launcher
可以调用浏览器访问一跳网址