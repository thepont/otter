Otter
=====

A combination theme and plugin for oh-my-zsh. But mostly just a way to keep my terminals up to date across various computers.


Installation
------------

Clone the repo somewhere and set the `ZSH_CUSTOM` variable to the Otter Directory

    ZSH_CUSTOM=$HOME/path/to/otter
    ZSH_THEME="otter"
    plugins=(otter some other rad plugins)



Aliases
---------

### Otter

`otter` : cd to the otter folder


---
###Git


`g`         : Shorter Git

`gc`        : Add eveything and commit with a message

`ga`        : Add all files from repo root.

`gf`        : Better Fetch

`gg`        : Quick repo update

`grm`       : Make git forget a file

`gwhoops`   : Amend files to last commit

`gdelete`   : Delete local and remote copy of branch

---
### Maven/Jetty shortcuts

`jrun` : Run Jetty

`jfrun` : Run a forked version of Jetty

`jkill` : Kill the latest jetty instance

---
### Stash

`pr` : Create a pull request

---
### Bower

`bower` : No Glob for ZSH usage

---
### Tig

`t`     : Shorter Tig

`tst`   : Tig Status

---
### oh-my-zsh

`zc`    	: Edit Config

`zr`    	: Reload Config

`ohmyzsh` 	: Open ohmyzsh folder

---
### Misc

`k`     : Kill a process

`cello` : Sing a Song


  
   

Functions
---------

###`ip`
A Cleaner Print of your current IP


###`serve`
A super simple local php server. 

    => serve hostname(localhost) port(8000)

###`npmi`
NPM Install shortcut.
    
    => npmi grunt
    => npm install grunt --save-dev

###`def`
Returns a dictionary definition of input.  
http://vikros.tumblr.com/post/23750050330/cute-little-function-time

###`path`
Display a neatly formatted path.

###`any`
Search for running processes
http://onethingwell.org/post/14669173541/any



References
----------

[http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/](http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/)  
[https://gist.github.com/joshdick/4415470](https://gist.github.com/joshdick/4415470)

