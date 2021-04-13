# w3a文件格式简介

考虑到添加技能是如此的重要，并且有时无法通过world editor自动完成，这里特别的将w3a格式进行说明。

## 没有原版技能被修改时

![no-origin-changed](https://github.com/G-cream/THD967g-Reborn/blob/assets/images/no-origin-changed.png?raw=true)<br>

可以看到，这里以Amgl为模板新增了一个技能A000，并且其中的levels属性被修改为3，经过在AbilityMetaData.slk中查找levels对应的id为alev。

下面是对应的w3a文件：
>00000000: 02 00 00 00 00 00 00 00 01 00 00 00 41 6D 67 6C<br>
>00000010: 41 30 30 30 01 00 00 00 61 6C 65 76 00 00 00 00<br>
>00000020: 00 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00

根据inside w3m中对w3a文件格式的介绍，数据分别对应如下：
* 02 00 00 00: 版本号(并不像原文所说的通常是1)
* 00 00 00 00: 没有原版技能被修改，对应原文的Even if we don't have any changes on original table, this value must be there.


## 有原版技能被修改时

![origin-changed-1](https://github.com/G-cream/THD967g-Reborn/blob/assets/images/origin-changed-1.png?raw=true)<br>

![origin-changed-2](https://github.com/G-cream/THD967g-Reborn/blob/assets/images/origin-changed-2.png?raw=true)<br>