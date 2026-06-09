My OMZ plugin custom folder

Install oh-my-zsh from instructions at [Install oh-my-zsh now](https://ohmyz.sh/#install)  
  
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> [!WARNING]
> DESTRUCTIVE!!! If you have an existing omz custom folder back it up or clone elsewhere and integrate manually.
  
```bash
cd cd ~/.oh-my-zsh
rm -rfv custom
git clone --recursive https://github.com/walkerk1980/omz-custom.git custom
```  

