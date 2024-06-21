---
marp: true
title: Pineapple Quest
theme: default
---

# Pineapple Quest

## Základní informace
- **Žánr**: Plošinovka
- **Hlavní cíl**: Hlavním cílem je projít úroveň v co nejrychlejším čase. Dále je nutné po ceste posbírat všechny ananasy

---

# Tile mapa
- Systém, který umožňuje vytvářet herní prostředí pomocí základních stavebních prvků (tiles)
- Herní prostředí je vytvořeno pomocí Godot nástrojů pro práci s Tile mapou
![Tile mapa](./img/tilemap.png)


---

# Hráč
- Využívám speciální typ **CharacterBody2D**, který obsahuje základní funkcionality pro hratelnou postavu
- Obsahuje metody pro pohyb, skok a základní kolize
- Podporuje integraci animací pro různé stavy postavy 
- Kontrola hranic hratelné plochy
![stav idle](./img/char_idle.png)
![stav run](./img/char_run.png)

---
![stav jump](./img/char_jump.png)
![stav fall](./img/char_fall.png)

---

# Ostatní
- Dynamická kamera
- Sbírání předmětů (animace)
![predmet](./img/collectable.png)![predmet](./img/collectable2.png)
- Info panel ve hře
![info panel](./img/info_panel.png)

---

# Ostatní

- Hra si eviduje nejlepší čas u každého levelu v json formátu
![čas levelu](./img/time_evidence.png)

---

- Hlavní menu
![main menu](./img/main_menu.png)
---

- Game over menu
![gameover menu](./img/gameover_menu.png)
