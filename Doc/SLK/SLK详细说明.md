# War3.mpq中slk文件详解

![slk-in-mpq](https://github.com/G-cream/THD967g-Reborn/blob/assets/images/slk-war3mpq.jpg?raw=true)<br>

# slk文件是Office中Excel的专用文件，War3.mpq中共33个slk文件，列举了几乎所有的贴图文件、声音文件、效果的用途，有很好的参考作用。其中有常用的有：

>Splats/UberSplatData.slk<br>
>UI/SoundInfo/AbilitySounds.slk<br>
>UI/SoundInfo/AmbienceSounds.slk<br>
>UI/SoundInfo/AnimSounds.slk<br>
>UI/SoundInfo/UISounds.slk<br>
>UI/SoundInfo/UnitAckSounds.slk<br>
>UI/SoundInfo/UnitCombatSounds.slk<br>
>UI/SoundInfo/AnimLookups.slk<br>
>UI/SoundInfo/DialogSounds.slk<br>
>UI/SoundInfo/PortraitAnims.slk<br>
>UI/SoundInfo/MIDISounds.slk<br>
>Units/AbilityData.slk<br>
>Units/DestructableData.slk<br>
>Units/ItemData.slk<br>
>Units/UnitAbilities.slk<br>
>Units/UnitBalance.slk<br>
>Units/UnitData.slk<br>
>Units/UnitWeapons.slk<br>
>Units/UpgradeData.slk

# 下面将详细说明他们的用途(文中的透明度或Alpha是指图形学中Alpha运算，一种混合方法):

Doodads/Doodads.slk 定义了WC3中地面附属物的属性。各列的意义：
>A doodID 内部编号<br>
>B category 类别，如果没有说明则由附属物ID决定。<br>
>C tilesets 碎片设定，外形的贴图。<br>
>D tilesetSpecific 是否使用特殊碎片，0不使用。<br>
>E dir 路径<br>
>F file 文件<br>
>G comment 注释说明<br>
>H name 内部名<br>
>I doddClass 地形类别<br>
>J soundLoop 声音<br>
>K selSize 选择大小，选中后的圆圈的大小，0使用默认设置。<br>
>L defScale 默认比例<br>
>M minScale 最小比例<br>
>N maxScale 最大比例<br>
>O canPlaceRandScale 是否可以被放置随机起始圈，这一栏一定要付值为1<br>
>P useClickHelper 在编辑器中是否有帮助<br>
>Q maxPitch 最大斜度<br>
>R maxRoll 最大滚动<br>
>S visRaius 视野<br>
>T walkable 能否走动<br>
>U numVar 数目变量，不知道有什么用<br>
>V onCliffs 是否可以在悬崖上<br>
>W onWater 是否可以在水中<br>
>X floats 放在水中是的表面<br>
>Y shandow 是否有影子<br>
>Z showInFog 在雾中能否看见<br>
>AA animInFog 在雾中能否动<br>
>AB fixedRot 腐烂修正<br>
>AC pathTex 贴图路径<br>
>AD showInMM 是否在小地图中显示<br>
>AE useMMColor 是否覆盖默认的小地图颜色<br>
>AF MMRed 小地图红色<br>
>AG MMGreen 小地图绿色<br>
>AH MMBlue 小地图蓝色<br>
>AI vertR01 红色1<br>
>AJ vertG01 绿色1<br>
>AK vertB01 蓝色1<br>
>AL vertR01 红色2<br>
>AM vertG01 绿色2<br>
>AN vertB01 蓝色2<br>
>AO vertR01 红色3<br>
>AP vertG01 绿色3<br>
>AQ vertB01 蓝色3<br>
>AR vertR01 红色4<br>
>AS vertG01 绿色4<br>
>AT vertB01 蓝色4<br>
>AU vertR01 红色5<br>
>AV vertG01 绿色5<br>
>AW vertB01 蓝色5<br>
>AX vertR01 红色6<br>
>AY vertG01 绿色6<br>
>AZ vertB01 蓝色6<br>
>BA vertR01 红色7<br>
>BB vertG01 绿色7<br>
>BC vertB01 蓝色7<br>
>BD vertR01 红色8<br>
>BE vertG01 绿色8<br>
>BF vertB01 蓝色8<br>
>BG vertR01 红色9<br>
>BH vertG01 绿色9<br>
>BI vertB01 蓝色9<br>
>BJ vertR01 绿色10<br>
>BK vertG01 绿色10<br>
>BL vertB01 蓝色10<br>
>BM inBeta 是否是Beta版中的地形0不是1是

Splats/LightningData.slk 闪电的数据:
>A Name 名称<br>
>B comment 说明<br>
>C Dir 路径<br>
>D file 文件<br>
>E AvgSegLen 不知道什么意思，可能是闪电的长度<br>
>F Width 宽度<br>
>G R 红色<br>
>H G 绿色<br>
>I B 蓝色<br>
>J A 透明度<br>
>K NoiseScale 声音范围，估计是声音的时间<br>
>L TexCoordScale 不知道什么意思<br>
>M Duration 持续时间

Splats/SpawnData.slk 衍生物数据，死亡等。
>A Name 名称<br>
>B Model 模型、效果

Splats/T_SpawnData.slk 衍生物数据，可能是特殊的(我猜的)，其中有腐烂等。
>A Name 名称<br>
>B Model 模型、效果

Splats/T_SplatData.slk 间隔数据
>A Name 名称<br>
>B comment 说明<br>
>C Dir 路径<br>
>D file 文件<br>
>E Rows 行<br>
>F Columns 列<br>
>G BlendModel 混合模型 0 Blend 1 Add 2 Mod(融合，覆盖，取反)(说明是按我的记忆写的，我大学时学过高级图形学，可惜忘的差不多了)<br>
>H Scale 比例<br>
>I Lifespan 生命<br>
>J Decay 腐烂时间<br>
>K UVLifespanStart 这个单元的贴图在上方从左到右从0开始(这是直译，具体什么意思我不知道)<br>
>L UVLifespanEnd 同上<br>
>M LifespanRepeat 生命重复<br>
>N UVDecayStart 同上面的Lifespan对应<br>
>O UVDecayEnd 同上<br>
>P UVDecayRepeat 同上<br>
>Q StartR 开始红色<br>
>R StartG 开始绿色<br>
>S StartB 开始蓝色<br>
>T StartA 开始透明度<br>
>U MiddleR 开始红色<br>
>V MiddleG 开始绿色<br>
>W MiddleB 开始蓝色<br>
>X MiddleA 开始透明度<br>
>Y EndR 开始红色<br>
>Z EndG 开始绿色<br>
>AA EndB 开始蓝色<br>
>AB EndA 开始透明度<br>
>AC Water 水样<br>
>AD Sound 声音

Splats/UberSplatData.slk 这个文件定义了一些特殊效果的贴图和时间，例如人类建筑开始中间，回城卷轴的效果等。
>A Name 名称<br>
>B comment 说明<br>
>C Dir 路径<br>
>D file 文件<br>
>E BlendMode 混合模式，<br>
>F Scale 比例<br>
>G BirthTime 开始时间<br>
>H PauseTime 暂停时间<br>
>I Decay 腐烂时间<br>
>J StartR 开始红色<br>
>K StartG 开始绿色<br>
>L StartB 开始蓝色<br>
>M StartA 开始透明度<br>
>N MiddleR 中间红色<br>
>O MiddleG 中间绿色<br>
>P MiddleB 中间蓝色<br>
>Q MiddleA 中间透明度<br>
>R EndR 结束红色<br>
>S EndG 结束绿色<br>
>T EndB 结束蓝色<br>
>U EndA 结束透明度<br>
>V Sound 声音

TerrainArt/CliffTypes.slk 定义了悬崖的属性。:
>A cliffID 悬崖ID<br>
>B cliffModelDir 悬崖模型路径<br>
>C rampModelDir 悬崖饰物模型路径<br>
>D texDir 贴图路径<br>
>E texFile 贴图文件<br>
>F name 名称<br>
>G groundTile 地面名<br>
>H upperTile 上部名称(这一栏全空)<br>
>I cliffClass 悬崖类别<br>
>J oldID 老ID

TerrainArt/Terrain.slk 定义了地形的属性:
>A tileID 内部编码<br>
>B dir 路径<br>
>C file 文件<br>
>D comment 说明<br>
>E name 名称(real name)<br>
>F buildable 是否可建筑<br>
>G footprints 是否可以留下脚印<br>
>H walkable 是否可以在上面行走<br>
>I flyable 是否可飞越<br>
>J blightPri 当选中时，在它下面的tile是否都被选中<br>
>K convertTo 当变化时变化的优先级(即先变成什么)<br>
>L InBeta 是否是Beta版中的

TerrainArt/Water.slk 定义水的属性:
>A waterID 水的ID<br>
>B height 高度<br>
>C texFile 贴图文件<br>
>D mmAlpha 小地图Alpha运算(透明度演算)<br>
>E mmRed 小地图红色<br>
>F mmGreen 小地图绿色<br>
>G mmBlue 小地图蓝色<br>
>H numTex 贴图数<br>
>I texRate 贴图率<br>
>J texOffset 贴图坐标<br>
>K alphaMode alpha运算模式<br>
>L lighting 是否使用光线 1使用，0不使用<br>
>M cells 细块，碎片<br>
>N minX 最小X<br>
>O minY 最小Y<br>
>P minZ 最小Z<br>
>Q maxX 最大X<br>
>R maxY 最大Y<br>
>S maxZ 最大Z<br>
>T rateX X方向比例<br>
>U rateY Y方向比例<br>
>V rateZ Z方向比例<br>
>W revX X方向旋转<br>
>X revY Y方向旋转<br>
>Y shoreDir 海岸线路径<br>
>Z shoreSFile 海岸线表面文件<br>
>AA shoreSVar 海岸线表面变量，不知道什么意思<br>
>AB shoreOCFile 海岸线外面的碎片文件<br>
>AC shoreOCVar 海岸线外面的碎片变量<br>
>AD shoreCFile 海岸线内部碎片文件<br>
>AE shoreCVar 海岸线内部碎片变量<br>
>AF Smin_A 阴影的最小透明度<br>
>AG Smin_R 阴影的最小红色<br>
>AH Smin_G 阴影的最小绿色<br>
>AI Smin_B 阴影的最小蓝色<br>
>AJ Smax_A 阴影的最大透明度<br>
>AK Smax_R 阴影的最大红色<br>
>AL Smax_G 阴影的最大绿色<br>
>AM Smax_B 阴影的最大蓝色<br>
>AN Dmin_A 深度的最小透明度<br>
>AO Dmin_R 深度的最小红色<br>
>AP Dmin_G 深度的最小绿色<br>
>AQ Dmin_B 深度的最小蓝色<br>
>AR Dmax_A 深度的最大透明度<br>
>AS Dmax_R 深度的最大红色<br>
>AT Dmax_G 深度的最大绿色<br>
>AU Dmax_B 深度的最大蓝色

TerrainArt/Weather.slk 定义天气的属性:
>A effectID 效果ID<br>
>B name 名称<br>
>C texDir 贴图路径<br>
>D texFile 贴图文件<br>
>E alphaMode alpha模式<br>
>F useFog 是否允许使用雾效果<br>
>G height 高度<br>
>H angx 角度X<br>
>I angy 角度Y<br>
>J emrate em率<br>
>K lifespan 生命<br>
>L particles 粒子数<br>
>M veloc 意义不知道<br>
>N accel 同上<br>
>O var 变量 ?<br>
>P texr 贴图r<br>
>Q texc 贴图c<br>
>R head 头<br>
>S tail 尾<br>
>T tailen 尾的一个属性，不知道意思<br>
>U lati<br>
>V long 长度<br>
>W midTim 中间时间 ?<br>
>X redStart 下面X-AR都是贴图颜色和属性的定义<br>
>...<br>
>AR tUVEnd<br>
>AS AmbientSound 声音

UI/SoundInfo 目录下共12个文件定义了声音的属性。

UI/SoundInfo/AbilitySounds.slk 定义一些能力的声音:
>A SoundName 名称<br>
>B FileNames 文件名<br>
>C DirectoryBase 基础路径<br>
>D Volume 音量<br>
>E Pitch 程度<br>
>F PitchVariance 程度变化<br>
>G Priority 优先级<br>
>H Channel 频道<br>
>I Flags 标志<br>
>J MinDistance 最小距离<br>
>K MaxDistance 最大距离<br>
>L DistanceCutoff 关掉距离<br>
>M InsideAngle 内角<br>
>N OutsideAngle 外角<br>
>O OutsideVolume 外部音量<br>
>P OrientationX X方向<br>
>Q OrientationY Y方向<br>
>R OrientationZ Z方向<br>
>S EAXFlags EAX标志

下面这些文件的结构同AbilitySounds.slk的一样:
>UI/SoundInfo/AmbienceSounds.slk 环境的声音。<br>
>UI/SoundInfo/AnimSounds.slk 动作的声音。<br>
>UI/SoundInfo/UISounds.slk 游戏提示的声音。<br>
>UI/SoundInfo/UnitAckSounds.slk 单位攻击的声音。<br>
>UI/SoundInfo/UnitCombatSounds.slk 单位战斗的声音。

UI/SoundInfo/AnimLookups.slk 定义查找的关联，这种方法我在工作中常用，没想到暴雪也用:
>A AnimSoundEvent 事件名<br>
>B SoundLabel 声音的标志

UI/SoundInfo/DialogSounds.slk 对话框声音:
>A SoundName 名称<br>
>B FileNames 文件名<br>
>C DirectoryBase 基础路径<br>
>D Volume 音量<br>
>E Flags 标志

UI/SoundInfo/EAXDefs.slk EAX的定义:
>A EAXLabel EAX标志<br>
>B DisplayText 在编辑器中的显示名<br>
>C EffectLevel 效果等级<br>
>D EAX2Direct D-U都是与2D效果有关的<br>
>...<br>
>U Fast2DOcclusionScale<br>
><br>
>UI/SoundInfo/EnvironmentSounds.slk 环境声音，如森林、草地、湖的声音。<br>
>UI/SoundInfo/PortraitAnims.slk 单位的说话声，如兽族农民说的"OK"。<br>
>UI/SoundInfo/MIDISounds.slk MIDI声音列表

Units/ 目录下10个文件，定义了最重要的一些属性。

Units/AbilityData.slk 能力属性:
>A alias 允许使用不同效果的副本，大部分同code相同，即不允许使用。<br>
>B code 编码<br>
>C uberAlias Lookup时的名字<br>
>D comments 说明<br>
>E useInEditor 是否在编辑器中使用<br>
>F hero 是否是英雄能力<br>
>G item 是否是物品的能力<br>
>H sort 类别<br>
>I checkDep 从属检查，1玩家的能力0creep的能力<br>
>J levels 可以升的等级<br>
>K reqLevel 升第一级需要的等级<br>
>L targs 目标<br>
>M Cast1 第一级费用<br>
>...<br>
>M-AQ定义了1、2、3级的属性<br>
>...<br>
>AU Data34 第3级第4个数据

Units/DestructableData.slk 地面附属建筑物的数据。

Units/ItemData.slk 物品属性:
>A itmID ID<br>
>B comment 说明<br>
>C file 文件<br>
>D itemClass 类别<br>
>E level 等级<br>
>F uses 可用几次<br>
>G idealPrio 完美的排序<br>
>H prio 单位组中的排序<br>
>I usable 是否可用 1是0否<br>
>J perishable 是否是一次性物品 1是0否<br>
>K droppable 是否可扔掉 1是0不是<br>
>L drop 英雄被杀掉后物品是否会掉下，1会0不会<br>
>M stockMax 最大存量<br>
>N stockRegen 存储的再生速度<br>
>O stockStart 多长时间开始存储<br>
>P goldcost 金费用<br>
>Q lumbercost 木材费用<br>
>R HP 血<br>
>S armor 防御<br>
>T abilList 能力列表<br>
>U InBeta 是否在Beta版中出现

Units/UnitAbilities.slk 单位能力:
>A unitAbilId 单位ID<br>
>B sortAbil 能力类别<br>
>C comment(s) 说明<br>
>D auto 自动施放<br>
>E abilList 能力列表<br>
>F heroAbilList 英雄能力列表<br>
>G InBeta Beta版中出现

Units/UnitBalance.slk 单位定义:
>A unitBalanceID 单位ID<br>
>B sort 类别<br>
>C sort2 类别2<br>
>D comment(s) 说明<br>
>E level 等级<br>
>F 是否召唤单位，建筑物也是召唤单位<br>
>G goldcost 金费用<br>
>H lumbercost 木材费用<br>
>I goldRep 金回收<br>
>J lumberRep 木材回收<br>
>K fmade 生产人口数<br>
>J fused 占用人口<br>
>M bountydice 随机奖励点数<br>
>N bountysides 随机次数<br>
>O bountyplus 随意额外点数<br>
>P stockMax 最大存储数<br>
>Q stockRegen 存储回复时间<br>
>R stockStart 存储开始时间<br>
>S HP 开始HP<br>
>T realHP 真实HP<br>
>U regenHP HP回复率<br>
>V regenType 回复类型<br>
>W manaN 开始Mana<br>
>X realM 真实Mana<br>
>Y mana0 额外Mana<br>
>Z regenM Mana回复率<br>
>AA def 基础防御<br>
>AB defUp 每升一级增加的防御<br>
>AC realdef 真实防御<br>
>AD defType 防御类型<br>
>AE spd 速度<br>
>AF bldtm <br>
>AG sight 视野<br>
>AH nsight 夜间视野<br>
>AI STR 力量<br>
>AJ INT 智力<br>
>AK AGI 敏捷<br>
>AL STRplus 每次升级力量的增加<br>
>AM INTplus 每次升级智力的增加<br>
>AN AGIplus 每次升级敏捷的增加<br>
>AO abilTest 能力测试<br>
>AP Primary 主要属性<br>
>AQ upgrades 可升级的能力<br>
>AR InBeta 是否在Beta版中出现

Units/UnitData.slk 单位数据:
>A unitId 编号<br>
>B sort 类别<br>
>C comment(s) 说明<br>
>D race 种族<br>
>E prio 单位组中的排序<br>
>F threat 是否是有威胁的 1是0不是<br>
>G type 单位类型，例如巨人、不死的等等<br>
>H valid 是否有效<br>
>I deathType 死亡类型<br>
>J deadth 死亡<br>
>K canSleep 是可不可以睡眠<br>
>L cargoSize 可以通过的宽度<br>
>M movetp 移动类型<br>
>N moveHeight 移动高度<br>
>O moveFloor 移动的层次<br>
>P launchX 开始X<br>
>Q launchY 开始Y<br>
>R launchZ 开始Z<br>
>S impactZ 冲击Z<br>
>T turnRate 转身速度<br>
>U propWin 单位移动时面对的角度<br>
>V orientInterp 单位面向方向的补充<br>
>W formation 编队<br>
>X castpt 类似于dmgpt的一个参数关于法数伤害<br>
>Y castbsw 法术的另外一个参数<br>
>Z targType 对象<br>
>AA pathTex 贴图<br>
>AB fatLOS<br>
>AC collision 大小，2x2 small = 16,2x2 large = 31, 3x3 small = 32, 3x3 large = 47<br>
>AD points 点数，和时间有关，不知道有什么用。<br>
>AE buffType AI放置的类型<br>
>AF buffRadius AI放置的范围<br>
>AG namecount 名称总数<br>
>AH InBeta 在Beta版出现

Units/UnitMetaData.slk 单位素材数据:
>A ID id<br>
>B field 域，字段<br>
>C slk 在哪个slk中<br>
>D index 索引<br>
>E displayName 在编辑器中显示的名字<br>
>F sort 类别<br>
>G type 类型，字符串、整数、单位、浮点数等<br>
>H stringExt 字符串具体化<br>
>I caseSens 字符串敏感<br>
>J canBeEmpty 能否为空<br>
>K minVal 最小值<br>
>L maxVal 最大值，实数、非实数的最大值，字符串、字符串数组的最大长度<br>
>M useHero 英雄单位的字段？1是0否<br>
>N useUnit 普通单位的字段？1是0否<br>
>O useBuilding 建筑物的字段？1是0否<br>
>P useItem 物品的字段？1是0否<br>
>O useSpecific 特殊字段？1是0否

Units/unitUI.slk 定义单位的外观:
>A unitID id<br>
>B file 文件<br>
>C unitSound 声音<br>
>D tilesets 碎片设置<br>
>E tilesetSpecific 是否使用特殊碎片？<br>
>F name 名称<br>
>G unitClass 单位类型<br>
>H special 是否特殊<br>
>I inEditor 是否在编辑器中出现<br>
>J hiddenInEditor 是否能在编辑器中编译<br>
>K hostilePal 敌对？<br>
>L dropItems 能否掉物品<br>
>M nbrandom 如果这个单位是自然的建筑物能否被占领<br>
>N nbmmlcon 如果这个单位是自然的建筑物，能否在小地图中显示<br>
>O useClickHelper 是否使用帮助<br>
>P blend 混合模式<br>
>Q scale 比例<br>
>R scaleBull 是否公布由这个单位继承的比例<br>
>S preventPlace 能否被放置<br>
>T requirePlace 放置前提，只能是一种<br>
>U isbldg 是否是bldg<br>
>V maxPitch 最大倾斜<br>
>W maxRoll 最大滚动<br>
>X elevPts 计算海拔用的点数<br>
>Y elevRad 计算深度用的点数<br>
>Z fogRad 雾的深度<br>
>AA walk 移动速度<br>
>AB run 跑动速度<br>
>AC selZ 选择圈的高度<br>
>AD weap1 武器1<br>
>AE weap2 武器2<br>
>AF teamColor 小队颜色-1玩家的颜色<br>
>AG customTeamColor 是否可以定制小队颜色 <br>
>AH armor 护甲类型<br>
>AI modelScale 模型比例<br>
>AJ red 红色<br>
>AK green 绿色<br>
>AL blue 蓝色<br>
>AM uberSplat 间隔<br>
>AN unitShadow 单位阴影<br>
>AO buildingShadow 建筑物阴影<br>
>AP shadowW 阴影宽度<br>
>AQ shadowH 阴影高度<br>
>AR shadowX 阴影X<br>
>AS shadowY 阴影Y<br>
>AT occH<br>
>AU InBeta 在Beta版中出现？

Units/UnitWeapons.slk 单位武器定义:
>A unitWeapID id<br>
>B sortWeap 武器类别<br>
>C sort2 类别2<br>
>D comment(s) 说明<br>
>E weapsOn 那种武器可用<br>
>F-AL 是一种武器的定义<br>
>F weapType1 武器1类型<br>
>G targs1 目标<br>
>H acquire 学的，不知道什么意思<br>
>I minRange 最小平行距离<br>
>J rangeN1 单位攻击平行距离<br>
>K RngTst 攻击失误距离<br>
>L RngBuff1 如果目标移动了，判断是否还能打到目标<br>
>M atkType1 攻击类型<br>
>N weapTp1 武器类型1<br>
>O cool1 冰冻时间，即停顿时间<br>
>P mincool1 最小停顿时间<br>
>Q dice1 骰子次数<br>
>R sides1 骰子的面数<br>
>S dmgplus1 升级对伤害的提高<br>
>T DmgUpg 对非目标的伤害<br>
>U dmod1 为平衡性设置的一个字段<br>
>V dmgUp1 <br>
>W mindmg1 最小伤害<br>
>X avgdmg1 平均伤害<br>
>Y DPS 持续伤害<br>
>Z maxdmg1 最大伤害<br>
>AA dmgpt1 只要攻击就计算在内的一个参数<br>
>AB backSw1 活跃时间<br>
>AC Farea1 伤害面积<br>
>AD Harea1 伤害减半的面积<br>
>AE Qarea1 1/4伤害面积<br>
>AF Hfact1 1/2伤害时间<br>
>AG Qfact1 1/4伤害时间<br>
>AH splashTargs1 大面积伤害的对象<br>
>AI targCount1 目标总数<br>
>AJ damageLoss1 伤害失误率<br>
>AK spillDist1 迸溅距离<br>
>AL spillRadius1 迸溅范围<br>
>AM-BN是第二种武器的属性，和第一种武器的定义一样<br>
>BO InBeta 是否在Beta版中出现

Units/UpgradeData.slk 升级数据:
>A upgradeid Id<br>
>B comments 说明<br>
>C class 类别<br>
>D race 种族<br>
>E flag 标志位，必须是2的幂<br>
>F used 是否可用<br>
>G maxlevel 最大等级<br>
>H inherit 可继承<br>
>I goldbase 基础金需要<br>
>J goldmod 每次升级增加的金<br>
>K lumberbase 基础木头需要<br>
>L lumbermod 每次升级增加的木头<br>
>M timebase 基础时间需要<br>
>N timemod 每次升级增加的时间<br>
>O effect1 等级1的效果<br>
>P base1 等级1的基础<br>
>Q mod1 等级1的增量<br>
>R-Z分别是等级2、3、4的效果，和等级1一样。

Units/DestructableData.slk 可以破坏的(比如门等)数据:
>A DestructableID id<br>
>B category 编辑器中的类<br>
>C tilesets 碎片<br>
>D tilesetSpecific 是否使用特殊碎片效果<br>
>E dir 路径<br>
>F file 文件<br>
>G lightweight 光线宽度<br>
>H fatLOS <br>
>I texID 贴图ID<br>
>J texFile 贴图文件<br>
>K comment 说明<br>
>L name 编辑器中的名字<br>
>M doodClass 所属的附属物的类型<br>
>N useClickHelper 是否使用帮助<br>
>O onCliffs 是否能在悬崖上<br>
>P onWater 是否能在水中<br>
>Q canPlaceDead 是否可以放置死的<br>
>R walkable 能否走过<br>
>S cliffHeight 悬崖高度<br>
>T targType 目标类型，只能是tree,wall,debris<br>
>U armor 防御类型<br>
>V numVar 变化的数量<br>
>W HP 雪<br>
>X occH<br>
>Y flyH 飞行高度<br>
>Z fixedRot 混合腐烂 不知道意思<br>
>AA selSize 选择圈，0使用默认<br>
>AB minScale 最小比例<br>
>AC maxScale 最大比例<br>
>AD canPlaceRandScale 能放置随机圈<br>
>AE maxPitch 最大斜度<br>
>AF maxRoll 最大旋转<br>
>AG radius 视野<br>
>AH fogRadius 雾中的视野，即多远能看到<br>
>AI fogVis 雾中能否永远看到<br>
>AJ pathTex 贴图路径<br>
>AK pathTexDeath 死亡贴图路径<br>
>AL deathSnd 死亡后的贴图<br>
>AM shadow 阴影<br>
>AN showInMM 是否在小地图中显示<br>
>AO useMMColor 是否使用小地图颜色<br>
>AP MMRed 小地图红色<br>
>AQ MMGreen 小地图绿色<br>
>AR MMBlue 小地图蓝色<br>
>AS InBeta 是否在Beta版中出现