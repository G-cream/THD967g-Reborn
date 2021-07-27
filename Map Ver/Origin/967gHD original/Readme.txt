1. 脚本修改步骤：
    a. 分别生成图标脚本, 模型脚本与MPQ修改脚本
    b. 提取war3map.w3a, war3map.w3b, war3map.w3u, war3map.w3t, war3map.w3q, war3map.w3h, war3map.wtg, war3map.wct, war3map.j, war3map.imp
    c. 先执行图标脚本, 再执行模型脚本
    d. 对地图执行MPQ修改脚本
    e. 由于模型来自模型包，所以需要对模型再执行贴图路径修改脚本
    f. 将图标, 模型添加入地图中, 并替换前述10个war3map.w3x文件
    g. 在WE中打开地图并修改保存

2. 967g高清版升级过程
    a. we的导入文件中移除disbtnitemdisyyy, disbtnyoumu03
    b. we的导入文件中添加disbtn_itemsocialharmony, 修改路径为"ReplaceableTextures\CommandButtonsDisabled\disbtn_itemsocialharmony"
    c. we的导入文件中添加yukkuri.blp, yukkuri_face.blp, 修改路径为"yukkuri.blp", "yukkuri_face.blp"
    d. 单位中替换UUZ.mdx为neutral_10.mdx, 替换you.mdx为neutral_11.mdx
    e. 移除UUZ.mdx, you.mdx
    f. 修改btn_skilltoramaru0200-06为btn_skilltoramaruex00-06
    g. 修改天子要石tensi_stone.mdx为kanameishi.mdx，同时修改其引用的贴图路径
    h. 删除导入文件war3map.imp中重复的btn_itemllamadolllimitedon.blp与disbtn_itemllamadolllimitedon.blp
    i. 老虎模型Overhead附加点缺失，将toramaru.mdx骨骼中的Over Head Ref重命名为Overhead Ref
    j. 修改秋姐弹道，将模型shizuha_a.mdx中的贴图路径sizuha.blp更正为shizuha.blp
    k. 修改蕾蒂模型大小，将模型缩放比例从2.4调整至1.15