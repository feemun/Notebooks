pip install virtualenv

virtualenv --version

根据最佳实践，虚拟环境的根目录最好跟随工程目录，一般选择建在工程根目录下，目录名称最好也是固定的，例如统一叫：venv或.venv，这样方便形成一直至的操作体验，在不同项目上激活和关闭虚拟环境时的命令是一样的（因为虚拟环境的相对路径是一样的）。假设当前工程目录为：C:\Workspaces\Project-1，进入该目录，使用如下命令即可创建出一套虚拟环境，虚拟环境的文件全部存放在自动创建的.venv文件夹下：

virtualenv .venv
.venv\Scripts\activate

