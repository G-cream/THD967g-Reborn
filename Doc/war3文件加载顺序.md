# 介绍

这是inside w3m的第一章，由于其太重要了，但网络上的翻译者又未能达意，故在本人稍加翻译后单独列出。

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

>路径：HKEY_CURRENT_USER\Software\Blizzard Entertainment\Warcraft III\ <br>
>键名称："Allow Local Files"<br>
>键类型: dword<br>
>键值: 1

如果注册表键并没有设置，或者文件没有在目录中找到，那么会继续在您的地图文件中（W3M）中查找，然后是在最新的MPQ补丁（WAR3PATCH.MPQ）中查找，最后才是主要MPQ（WAR3.MPQ).

这就意味着您不需要修改官方MPQs（不要更改您的WAR3.MPQ），您只需要使用与"C:\Program Files\Warcraft III\"相同的目录或文件结构。

大多数情况下向地图(*.w3m)中添加文件都好使，但也不是什么时候都行。

下面是可以添加的:

>Units\\unitUI.slk<br>
>Units\\AbilityData.slk<br>
>UI\\MIDISounds.slk<br>
>Units\\HumanUnitFunc.txt<br>
>Units\\HumanUnitStrings.txt<br>
>Units\\HumanAbilityFunc.txt<br>
>Units\\HumanAbilityStrings.txt<br>
>Units\\HumanUpgradeFunc.txt<br>
>Units\\HumanUpgradeStrings.txt

下面是可以添加但工作得不是很好的：
>Units\\UnitMetaData.slk<br>
>Scripts\\Blizzard.j

下面是不可以添加的：
>TerrainArt\\CliffTypes.slk<br>
>Units\\MiscData.txt
 

当您真的需要去改变文件，让文件在地图被加载前或在地图外加载。我的建议是先备份您的"war3patch.mpq"，然后创建个新文件，把原来的war3patch.mpq和您修改后的文件添加到您刚创建的新"war3patch.mpq"。

请不要忘了备份您原本的war3patch.mpq，当您与别人对战时遇到版本冲突或者需要升级WAR3版本的时候，请还原备份的文件。

例如：

您有个叫"UI\MiscData.txt" 的文件同时存在于"War3Patch.mpq"和"War3.mpq"中。

魔兽程序默认使用在"War3Patch.mpq"中的文件。如果您要修改它，只需要在"C:\Program Files\Warcraft III\"中创建一个"UI\\"目录，然后提取"War3Patch.mpq"中的"MiscData.txt"文件并放入上面的目录中（即"C:\Program Files\Warcraft III\UI\MiscData.txt"）。注册表键就用上面的路径来修改。

现在，当您再次运行魔兽3的时候，就会用新的文件代替旧的文件了。

注意：

   >在某些情况下，假如您与别人对战，那么所有人都需要有同样有您修改过的文件，否则会出现像"netsyns eror"之类的错误。<br>
   >某一些文件需要一种“特殊”的格式，假如您修改了它们，您需要“伪造”这种格式，而且并不是什么时候都有效。假如无效，WAR3会试图找到一个“标准文件”进行代替。<br>
   >在WAR3.MPQ和WAR3PATCH.MPQ以外的文件，WAR3是不会使用的。