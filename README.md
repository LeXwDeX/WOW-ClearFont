# ClearFont(v4)

## 简介

本插件与早期台服网友撰写的ClearFont思路相同，参考了相关插件修改的字体对象。

v3版在原始代码基础上进行了完全重构，使用Hook，延迟加载等逻辑适配正式服的各类情况，并根据网游的一些要求做了字体的大小和位置微调。

v4版调整为魔兽世界12.0的新API，部分激活方式改为Hook方式。

## 建议

强烈推荐使用：[lxgw/LxgwWenKai: An open-source Chinese font derived from Fontworks' Klee One. 一款开源中文字体，基于 FONTWORKS 出品字体 Klee One 衍生。 (github.com)](https://github.com/lxgw/LxgwWenKai) 作为魔兽世界的主要字体，该字体清晰，比原生客户端的字体要好看，Y轴距离合理，并且适配游戏也不突兀。

---

## 记录

1. 修正了部分函数异常，可以支持11.0客户端； 
2. v2，代码完全重构；
3. 部分API只针对怀旧服做适配，正式服应该不需要所以没有管；
4. v3，代码重构为Hook模式，适配性更广；
5. v4，适配魔兽世界12.0版本；