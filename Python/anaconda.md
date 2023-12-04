conda使用步骤

```shell
# 创建环境
conda create --name myenv python=3.8
# 激活环境
conda activate myenv
# 安装依赖
conda install requests beautifulsoup4 pdfkit
# 工作完成，退出环境
conda deactivate

```



环境管理

```shell
# 查看所有已安装的conda环境
conda env list
conda info --envs

# 根据环境名删除环境
conda env remove --name myenv

# 删除指定名称的环境及其所有依赖项
conda remove --name myenv --all



```

复制旧环境

```shell
要将一个conda环境（比如 `envA`）复制为一个新的环境（比如 `envNew`），你可以使用 `conda create` 命令并指定 `--clone` 标志，然后指定要复制的原始环境的名称和新环境的名称。以下是具体步骤：

1. 打开终端或命令提示符，并确保你的conda环境是激活的（你可以使用 `conda activate` 命令激活 `envA`）。

2. 使用以下命令复制环境：

   ```bash
   conda create --name envNew --clone envA
   ```

   这将创建一个名为 `envNew` 的新环境，并将 `envA` 中的所有依赖项复制到新环境中。

3. 如果需要，可以使用 `conda activate envNew` 命令激活新环境。

现在，你已经成功地复制了一个conda环境并创建了一个新的环境 `envNew`，它与原始环境 `envA` 具有相同的依赖项和配置。你可以在新环境中进行进一步的开发或测试工作，而不会影响原始环境。

```

