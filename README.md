
## **_heavenWM_** 
an aesthetic tiling window manager configuration

---

### * * *
<q>Just clone the repo</q>

```bash
git clone --depth 1 https://github.com/Dan7h3x/heavenWM.git
```
then
```bash
cd heavenWM
sudo cp -rf Fonts/* /usr/share/fonts
sudo cp -rf BinFiles/* /usr/local/bin
cp -rf Configs/* ~/.config
```


### BSPWM

> For `BSPWM` you need the these dependencies:

```
bspwm, polybar, rofi, sxhkd, i3lock-color, btop, alacritty, feh
```
### The installiation is finished but you can customize the bspwm by editing these files:

`{bspwm}`:  **main config**
>> ~/.cofig/bspwm/bspwmrc

`{polybar}`:  **bar**
>> ~/.cofig/bspwm/polybar/config.ini

`{sxkhd}`:   **keybinding**
>> ~/.cofig/sxhkd/sxhkdrc


### DWM
> For `DWM` you need the these dependencies:
```
imlib2, gd, mpdclient, fribidi, rofi, feh, xinerema, xft (pango)
```

### Installation process

1. First of all build `dmenu`:
```bash
cd ~/.config/Suckless/DMENU
sudo make clean install
```

2. Second build `st` terminal:
```bash
cd ~/.config/Suckless/ST
sudo make clean install
```

3. Now you can build `dwmblocks`:
```bash
sudo cp -rf ~/.config/Suckless/dwmblocks-scripts /usr/local/bin

cd ~/.config/Suckless/DWMBLOCKS
sudo make clean install
```

4. Finally build `dwm` and reboot or relogin to it:
```bash
cd ~/.config/Suckless/DWM
rm config.h
rm patches.h
sudo make clean install
```

### For edit the default configs of all `Suckless` folder just modify their `config.def.h` file.