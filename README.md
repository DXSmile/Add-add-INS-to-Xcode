# 如何给Xcode添加插件?
#### 如何给Xcode添加我们常用的插件呢?
**下面用我们常用的一个快速添加注释的插件来举例:{VVDocumenter-Xcode}**
##### 1.首先我们需要知道自己电脑中Xcode的UUID
步骤如下：
&1.1.查看Xcode的UUID
在终端执行 defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
运行之后,这里会得到一串字符串,也就是我们的UUID,如:F32BD31E-2683-44B8-AE8F-5F09E918793E
&1.2.复制UUID后面那一串字符串
&1.3.然后打开xcode插件所在的目录：~/Library/Application Support/Developer/Shared/Xcode/Plug-ins；
选择已经安装的插件例如VVDocumenter-Xcode，右键”显示包内容”；

&1.4.找到info.plist 文件，找到DVTPlugInCompatibilityUUIDs的项目，添加一个Item，Value的值为之前Xcode的UUID，按tab键保存。
&1.5.重启Xcode 7之后，重启Xcode时会提示“Load bundle”、 “Skip Bundle”，这里必须选择“Load bundle”，不然插件无法使用。
重启之后,就可以使用了;

##### 2.如果手误点击了"Skip Bundle" 肿么办？
&2.1   找到该插件安装路径下，继续打开在info.plist删除与命令端里面同样的UUID号(一般都是会再最后一行)，自己添加的那一行也要删除掉
保存之后重启Xcode

&2.2.    再次添加之前xcodeUUID。在重启就再次出现插件提示了,继续选择“Load bundle”,然后启动Xcode就可以使用了;
