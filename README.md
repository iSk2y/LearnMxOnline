# LearnMxOnline



学习Python3.x与Django2.0.1在线教育平台网站的开发，代码记录，[简书记录](https://www.jianshu.com/p/ec284482fc89)



# 开发环境

- Python 3.6.6
- Django 2.0
- OS：Windows （其实我是很想在Linux上开发的，奈何我开个虚拟机就炸锅了）
- MySQL：5.7

# Quick Start

```shell
$ git clone https://github.com/iSk2y/LearnMxOnline.git
$ cd LearnMxOnline
$ pip install -r requirement.txt
```



- **数据库部署**：SQL结构和数据均已给出，安装MySQL后创建名为mxonline库，导入SQL即可。
- **super**：默认super的账号为admin，密码为rootroot

```shell
$ python manage.py runserver
```



# 收获

- CBV模式的进一步熟悉使用，CBV模式的装饰器
- model建立思想，一对多关系等。为防止循环调用，需要构建的有层次。
- 在model中书写某些orm查询，而后在模板中直接调用该变量的属性来使用。而不直接在view中书写
- 注册、找回密码、更换邮箱、全局消息等具体逻辑实现思路。
- xadmin组件的进阶使用
- 全局配置处理404和500的方法。
- 项目部署上线的大体步骤。