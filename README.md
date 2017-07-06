一、mysql数据库版本5.7.16，修改applicationContext.xml下数据库链接配置的用户名与密码与本机相同，
    新建数据库ok3w (utf8编码)，导入database下的sql文件(不可用navicat for mysql客户端，用mysql.exe命令导入)。
二、可用maven编译运行此项目 (mvn jetty:run-war)。
三、管理员用户密码（admin,admin）
四、此工程下所有java文件编码为gbk，如导入eclipse后编码被转换为utf8，需修改maven compile插件配置
五、本项目由某asp项目修改而来，用到了ssh框架，学习用，实现了web文章管理的基本功能
