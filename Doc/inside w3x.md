# 前言

前面翻译了一篇关于MPQ的文章，也许是能看懂的人太少，也许是文章已经被翻译过了，关注的人很少，心里有种淡淡的失落感。好在一位同学的提醒下，决定去翻译这篇文章。上次的翻译太急功近利，仅仅熬夜两晚就完成了，语句上没有太多的推敲，造成阅读上有许多障碍，这次的文章比较长，所以打算慢慢打磨推敲一下。花费了将近一个月的时间，终于把这篇文章全部翻译完成，对于之前翻译的内容做了修正和补充。现制作为电子书，供下载后慢慢观看研究。

如有转贴，请注明本网站：http://www.islga.org

# 介绍

本文档包括了所有的WAR3地图文件（*.W3M和*.W3X）的详细说明。不过并没有暴雪的任何官方帮助说明，也不涉及WAR3引擎的"逆向工程"。这里所介绍的文件版本是WAR3的最初版本，请注意您真在查看和修改的文件版本。

最后，使用这个文件需要承担一定风险，如果您改动了文件遭成任何后果，我不负任何责任。

# 1)改图前你需要知道的事
## 1.1) 系统环境

您需要安装好WAR3，在"C:\Program Files\Warcraft III\"。我们将在这里谈论的是WAR3文件的最初版本，所以可以基于一切您使用的版本文件格式。您必须意识到在不同版本文件中是有所差异的，不过只要是安装了完整的魔兽争霸3，那么您应该会看到这些文件的（当然还有一些其他的文件，而且我会用为例子）：

在"C:\Program Files\Warcraft III\":

>-WAR3.MPQ

和在"C:\Program Files\Warcraft III\Maps\":

>-(4)Lost Temple.w3m

当然还有其他的W3M文件。 

"W3M"地图文件可以用任何支持WAR3的MPQ编辑器，那么我建议您使用(WinMPQ (ShadowFlare))。您也可以使用MPQview, 不过会麻烦些。最后，您还需要一个十六进制编辑器，我推荐的是hexworkshop。
 
## 1.2) WAR3文件
### 1.2.1) 关于MPQ文件

MPQ文件就像是"RAR"或"ZIP"文件，包含了被压缩文件的目录结构。在这里并不详细说明，具体的说明请看：http://www.islga.org/bbs/read.php?tid=13735

### 1.2.2) WAR3文件结构

当查找一个文件时，WAR3会最先在“真正的”目录中查找（就像网页浏览器的一样）。假如您设置一个特殊的注册表键：

>路径：HKEY_CURRENT_USER\Software\Blizzard Entertainment\Warcraft III\

>键名称："Allow Local Files"

>键类型: dword

>键值: 1

如果注册表键并没有设置，或者文件没有在目录中找到，那么会继续在您的地图文件中（W3M）中查找，然后是在最新的MPQ补丁（WAR3PATCH.MPQ）中查找，最后才是主要MPQ（WAR3.MPQ).

这就以为着您不需要对官方MPQs变址（不要更改您的WAR3.MPQ地址），您只需要使用 与"C:\Program Files\Warcraft III\"相同的 目录/文件结构 。然后添加*.W3M文件和其他大部分文件，不过不是全部。

例如:

需要

   Units\unitUI.slk

   Units\UnitMetadata.slk

   Units\HumanUnitFunc.txt

   Units\HumanUnitStrings.txt

   Units\HumanAbilityFunc.txt

   Units\HumanAbilityStrings.txt

   Units\HumanUpgradeFunc.txt

   Units\HumanUpgradeStrings.txt

 

不需要

   Units\AbilityData.slk

   Units\MiscData.txt

 

当您真的需要去改变文件，让文件不在地图装载前被装载 或者根本不被装载。

我的建议是先备份您的 "war3patch.mpq"，然后创建个新文件，把原来的war3patch.mpq 和您修改后的文件添加到您刚创建的新"war3patch.mpq"。

请不要忘了备份您原本的war3patch.mpq，当您与别人对战时遇到版本冲突或者需要升级WAR3版本的时候，请还原备份的文件。

 

例如：

您有个叫"UI\MiscData.txt" 的文件同时存在于"War3Patch.mpq"和"War3.mpq"中。

魔兽程序默认使用在"War3Patch.mpq"中的文件。如果您要修改它，只需要在"C:\Program Files\Warcraft III\"中创建一个"UI\"目录，然后提取"War3Patch.mpq"中的"MiscData.txt"文件并放入上面的目录中（即"C:\Program Files\Warcraft III\UI\MiscData.txt"）。

注册表键就用上面的路径来修改。

现在，当您再次运行魔兽3的时候，就会用新的文件代替旧的文件了。

 

 

注意：

     — 在某些情况下，假如您与别人对战，那么所有人都需要有同样有您修改过的文件，否         则会出现像"netsyns eror"之类的错误。

     — 某一些文件需要一种“特殊”的格式，假如您修改了它们，您需要“伪造”这种格式         ，而且并不是什么时候都有效。假如无效，WAR3会试图找到一个“标准文件”进行代         替。

     — 在WAR3.MPQ和WAR3PATCH.MPQ以外的文件，WAR3是不会使用的。

 

 

1.2.3） 地图文件（W3M）

去编辑一个地图，您必须解压W3M中的某个档案，然后编辑档案，最后再把档案放回W3M文件。

不过W3M文件和MPQs文件是有不同的。我会在“W3M文件格式一节”和以下各节对W3M内其他档案做更多的介绍。

 

 

1.3  WAR3数据格式

 

暴雪在档案中使用了多种方式储存数据。不过还是经常使用到了通用类型。

 

__Integers整数

 

整数使用了4bytes(高高低低原则)储存。 就是说读取的第一个字节是最后一个字节。

就像C++中的"int"(signed)。

大小：4 bytes

例子：1234（十进制）=[00 00 04 D2]h  储存后是[D2 04 00 00]h

 

 

__Short Integers数值稍小的整数

 

数值稍小的整数使用了2bytes（高高低低原则）储存。

与C++中的signed short相近，不过Short Integers的范围是-16384到16383.

就是说可以随意用来做flag。

大小：2bytes

 

__Floats小数

 

小数使用标准IEEE 32位浮点数格式。使用4bytes（高高低低原则）储存。

就像C++中的"float"。

大小：4bytes

例子：7654.32（小数）

这个数字不能直接使用此格式储存，所以系统将会使用最最接近的值，而且能够用二进制数储存的数字代替。最接近的是：7654.319824(小数)=[45 EF 32 8H]h  储存后是[8F 32 EF 45]h

 

__Chars and Array of Chars字符和字符数组

 

字符使用标准chars(1char=1byte)储存，字符数组不得使用空字符

大小（chars）:1byte

     (array of chars):通常4bytes

 

 

__Trigger Strings and Strings触发字符串和字符串

 

字符串只是用一个空字符（C++ "\0"）结束的字符数组。只不过暴雪有时使用特殊的控制代码来改变现实颜色。就像"|c00BBGGRR"，"BB","GG","RR"是用十六进制值（每个使用2位数）来代表蓝色，绿色和红色的值。

如果一个字符串使用 "TRIGSTR_" 做开头（区分大小写），则被视为触发字符串。一个触发字符串在记忆体中以("TRIGSTR_***") 开头，并且在WAR3需要显示它的时候会改变。所以在用户屏幕上出现的不是"TRIGSTR_000"，WAR3会在加载地图时查看触发字符串表，然后用对应的触发字符串代替后显示。除了WTS通常自己定义触发字符串表外，触发字符串只对W3M内部文件有用（Jass,w3i)。如果在"TRIGSTR_" 下的数字为负，触发字符串将会指为一个NULL（空）字串；如果"TRIGSTR_" 下是文本，它将被视为触发字符串#0（= "TRIGSTR_000"）。

"TRIGSTR_7", "TRIGSTR_07", "TRIGSTR_007"和"TRIGSTR_7abc"全部指向触发字符串#7；

"TRIGSTR_ab7", "TRIGSTR_abc"和"TRIGSTR_"全部指向触发字符串#0."TRIGSTR_-7"是负的，将不会指向任何触发字符串，显示" "。按照惯例。"TRIGSTR_" 后为三位数，以空字串结束。

例1：

您设置字符串"blah |c000080FFblah", WAR3将显示"blah blah"，但是第二个blah将显示为橙黄色（blue=00 + green=80 + red=FF ==>orange）

例2：

您设置"TRIGSTR_025" ，字符串25在.WTS文件中被定义为"blah|c000080FFblah", 那么显示的结果和例1一样。

大小（字符串）：变化的。字符串长度+1（空终止符）

    （触发字符串）：12 bytes

 

 

 

__ Flags

 

flags就是布尔值（TURE或FALSE,1或0），被储存为4 bytes。

每位都是一个flag(4 bytes = 32 bit = 32 flags)。

暴雪在储存flags使用整数。

大小：通常4 bytes

 

 

__ Custom Types

 

有时候，字节会被整数和flags共用。

在W3E文件格式中，水平线和2 Flags使用着相同的4字节组。

最高2位为flags，后两位为水平线。更有时一个字节包含两个或更多的数据。

 

__ Structures 结构

WAR3也使用各种大小的构造类型。

 

 

 

 

 

 
