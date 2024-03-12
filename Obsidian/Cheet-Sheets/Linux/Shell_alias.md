
You can use this on any unix or linux base system.
Just copy and paste  in your *shellrc  file (.bashrc  .zshrc .zprofile  etc...)
Make sure that your os have the packages for the specific extensions. If not, don't worry, you will be prompt and you can can install after a missed try... 

alias "ex" to extract any archive(s) 

```
ex () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
	    		*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
```

alias mkdir="mkdir -pv"
