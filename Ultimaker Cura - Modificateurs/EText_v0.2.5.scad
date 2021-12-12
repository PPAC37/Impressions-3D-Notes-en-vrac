/**
Essai d'extrusion de caratéres "vide".

 @todo Mode Tampon / Tampon inversé 
 @rodo mode extrusion simple
 @done Mode extrusion bordure exterieur
 @todo Mode extrusion bordure par interieur
 @todo mode couvercle 2

 @todo pour mode multicouleur via change filament M600
 cf des niveaux qui se supperpose sans creux ... 0 = blanc 1=couleur 2... n-1 = noir.
 
https://openscad.org/  

OpenSCAD version 2021.01 
sudo apt-get install openscad
snap install openscad

google.com/search?q=ubuntu+18.04+install+new+font

Fichier EText_v0.2ht_dxf.scad
 @author PPAC
 @date 
Date 18/05/2021 dd/mm/YYYY
Date 05/06/2021 dd/mm/YYYY
Date 05/06/2021 dd/mm/YYYY OpenSCAD 2021.06.06 
Date 09/06/2021 dd/mm/YYYY OpenSCAD 2021.06.06 ...
EText_v0.2ht_dxfB
Date 11/06/2021 dd/mm/YYYY EText_v0.2.5.scad

 @Etat : Base fonctionnel ... mais pas les modes ++ (ex: twist) et a débuger !
Version 0.2.x

 * @url     ? todo lien thingiver
 * @see     ? ?? 
 * @license ? CC-BY-NC-4.0 ?
 
 https://github.com/openscad/openscad/issues/3701
 https://en.wikipedia.org/wiki/Runes
 ᚠᚡᚢᚣᚤᚥᚦᚧᚨᚩᚪᚫᚬᚭᚮᚯ
 
 Crash avec certaine font
 https://github.com/openscad/openscad/issues/3633
 
 whereis openscad
openscad: /snap/bin/openscad 
version 2021.01 

Le 06 06 2021 git clone + build (Ub 18.04 ...)
et là ne crash plus ...
Rendue semble plus rapide
Preview sans les coté fils de fer ...

 
 @todo mode timbre / tampon encreur
 @todo mode moule (inverse du tampon encreur ..?)
 
 @bug extruded twist semble bancale ... et créer des problème de choérence / viablilité de couvercle emboitable ...
 @TODO si vraiment du temps ... decomposition de la chaine de texte pour : hull d'un caractére / caractére et non d'un mot ... ? twister chaque caractéres et non le mot ?
 
 
 @TODO et une image plutot que du texte ? (choix image si existe ? ou boolean et if ...
 
 @TODO 
 Reformater correctement le code en réspectante les bons usages (retour a la ligne un maximum ... )
 @TODO
 Intertionalisation ? ?? du moins version en et fr
 @DONE BUG 
 La notion de Hauteur de la base se trouve partagé avec le couvercle et cela créer un gros defaut qd la hauteur de la base se trouve plus grnade que ? alors le couvercle n'ai plus vraiment un couvercle mais un bloc ...
 
 
TODO correctif de lespacement etre les caractéres si un mot car sinon superposition ...
TODO chanfrein ? arondis ?
TODO plus de choix de police
TODO voir d'autre méthode d'extrusion
TODO utilisation de $fn pour "lisser" les courbes des caratéres

TODO nettoyage du code et regrouper ici les lien vers la documentation de référence

TODO revoir le nomage des variables pour etre cohérent avec le nom de fichier proposé par le echo de la console ...

TODO voir pour formater le nom de fichier pour eviter des problème de nom de fichier nom accepté ... et pour ajouter le nom de la police

v0.2 TODO couvercle ( mode : couvercle simple (plus gros avec bord), long->+bord base, enboidé cf escalier cf decoupe escalier )
? rotation ? petit jeu de tolérance ? ....
? avoir un module avec plein de paramétres et un max de if ou plusieur module selon les cas ... donc juste un switch ... et des modules presque identique mais avec des petite varaition ?

Documentation de références :
https://openscad.org/cheatsheet/index.html?version=2019.05
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#minkowski
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/General#Variables
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#offset
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text


To allow specification of particular Unicode characters, you can specify them in a string with the following escape codes;

\x03     - hex char-value (only hex values from 01 to 7f are supported)
\u0123   - Unicode char with 4 hexadecimal digits (note: lowercase \u)
\U012345 - Unicode char with 6 hexadecimal digits (note: uppercase \U)
t="\u20AC10 \u263A"; // 10 euro and a smilie

To get available font on your system
$ fc-list -f "%-60{{%{family[0]}%{:style[0]=}}}%{file}\n" | sort

$ fc-list -f "\"%{{%{family[0]}%{:style[0]=}}}\","

https://www.nerdfonts.com/font-downloads

Adding new fonts
Open up a terminal window.
Change into the directory housing all of your fonts.
Copy all of those fonts with the commands sudo cp *. ttf *. TTF /usr/share/fonts/truetype/ and sudo cp *. otf *. OTF /usr/share/fonts/opentype.

Select "OPEN WITH FONTS." Right click on it.
Another box'll appear. ...
Click on that and the fonts will get installed.
---
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text#Using_Fonts_&_Styles
Using Fonts & Styles[edit | edit source]
Fonts are specified by their logical font name; in addition a style parameter can be added to select a specific font style like "bold" or "italic", such as:

font="Liberation Sans:style=Bold Italic"
The font list dialog (available under Help > Font List) shows the font name and the font style for each available font. For reference, the dialog also displays the location of the font file. You can drag a font in the font list, into the editor window to use in the text() statement.

OpenSCAD includes the fonts Liberation Mono, Liberation Sans, and Liberation Serif. Hence, as fonts in general differ by platform type, use of these included fonts is likely to be portable across platforms.

For common/casual text usage, the specification of one of these fonts is recommended for this reason. Liberation Sans is the default font to encourage this.

In addition to the installed fonts, it's possible to add project specific font files. Supported font file formats are TrueType Fonts (*.ttf) and OpenType Fonts (*.otf). The files need to be registered with use<>.

use <ttf/paratype-serif/PTF55F.ttf>

After the registration, the font is listed in the font list dialog, so in case logical name of a font is unknown, it can be looked up as it was registered.
*/

// "7-Segment"
// aprées reload depuis la liste des fonts "7\\-Segment:style=Regular"
//use <7segment.ttf>
// créer un Waring et une erreur bloqaunte si le fichier n'existe pas.

//fichier .dxf 
le_fichier_dxf="./dxf/pok346k7.dxf"; //
//todo import(le_fichier_dxf); vs dxf_import ? dim_dxf ?

//le_fichier_dxf_ratio=0.5;

//utiliser le fichier dxf et non le texte
use_dfx_file=false;

//Le texte pour generer les contours a extruder (bien prendre en compte la font utilisé 'fc-list "Nom de la font"' pour trouvé le fichier de fonts utilisé et avoir une idée des "glyphs" disponible avec par exemple : https://torinak.com/font/lsfont.html .
leTexte="G\u263A\u20AC";//

/*

// ᚡᚢᚣᚤᚥᚦᚧᚨᚩᚪᚫᚬᚭᚮᚯ
$ fc-list :charset=`printf "%x" "'ᚡ"`
/usr/share/fonts/truetype/freefont/FreeMono.ttf: FreeMono:style=Regular,нормален,normal,obyčejné,Standard,µεσαία,Normaali,Normál,Normale,Standaard,Normalny,Обычный,Normálne,menengah,прямій,navadno,vidējs,normalusis,thường,Arrunta,सामान्य


❦ ❡ ❤🙐 🙑 🙒 🙓 🙔 🙕 🙖 🙗
*/
//☺ = \u263A
//€ \u20AC
//╥
//ɑ æ ɛ ɪ ə ᴧ ɝ ɔ ʊ ː
//ā ä ē ĕ ī ĭ ō ŏ ȯ ô û ü
//• ◦ ‣ ⦿ ⦾ ⁃ ◘ ❥ ⁌ ⁍ ☙ ❧
/*
\n -> Non imprimable ...?
❦ ❡ ❤
2610		ﳚ®󱅏☐☑☒☓☔☕☖☗☘☙☚☛Ж☜☝☞☟
⁀ ⎁ ⎂ ⎃ ⎄ ⎅ ⎖ ␥ ␦ �￼ ⯑ ⯒
⑀ ⑁ ⑂ ⑃ ⑄ ⑅ ⑆ ⑇ ⑈ ⑉ ⑊
ƒ
❄ ❅ ❆
🌣 🌞 ⛅ 🌤 🌥 ⛱
🌦 🌧 ☔ ☂ 🌂 ⛆ 🌢≅⛨‼😸
😸😃 😋 😍 😲
≅♂♁⛨‼µμ
♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ⛎
☀ ☼
☀ ☼ 🀄🍀 🍁 🍂 🍃🦋 🐛 🐝 🐞 🐜 🕷 🕸 🦂 🦗 🦟 🦠🐭 🐹 🐰 🐶 🐺 🦊 🐯 🦁 🦒 🦓 🐴 🐮 🐷 🐽 🐻 🐼 🐸 🐲 🦄 🐵 🙈 🙉 🙊 🐱 🐾 😸 😹 😺 😼 😻 😽 😾 😿 🙀
🎹 🎻 🎷 🎺 🎸 🥁 🎵 🎶 🎼 🎜 🎝 ♩ ♪ ♫ ♬ 𝅜 𝅝 𝅗𝅥 𝅘𝅥 𝅘𝅥𝅮 𝅘𝅥𝅯 𝅘𝅥𝅰 𝅘𝅥𝅱 𝅘𝅥𝅲 𝄺 𝄩 𝄻 𝄼 𝄽 𝄾 𝄿 𝅀 𝅁 𝅂 𝄒 𝄓 𝄐 𝄑 𝆏 𝆐 𝆑 𝆒 𝆓 𝄀 𝄁 𝄂 𝄃 𝄄 𝄅 𝄔 𝄕 𝄆 𝄇 𝄈 𝄉 𝄊 𝄋 𝄌 𝄍 𝄎 𝄏 𝄖 𝄗 𝄘 𝄙 𝄚 𝄛 𝄚𝄞 𝄚𝄡 𝄚𝄢 𝄚𝄟 𝄚𝄠 𝄚𝄣 𝄚𝄤 𝄚𝄥 𝄚𝄦 ♯ 𝄪 𝄰 𝄱 𝄲 ♭ 𝄫 𝄬 𝄭 𝄳 ♮ 𝄮 𝄯 𝄶 𝄷 𝄸 𝄹 𝄴 𝄵 𝆌 𝆍 𝆎 𝆔 𝆕 𝆖 𝆛 𝆜 𝆝 𝆞 𝆟 𝆠 𝆡 𝆢 𝆣 𝆤 𝆥 𝆃 𝆄 𝆱 𝆲 𝆗 𝆘 𝆙 𝆚 𝆦 𝆧 𝆨 𝆩 𝆮 𝆯 𝆰 𝄜 𝄝 𝆶 𝆷 𝆸 𝆺 𝆺𝅥 𝆺𝅥𝅮 𝆺𝅥𝅯 𝆹 𝆹𝅥 𝆹𝅥𝅮 𝆹𝅥𝅯 𝇁 𝇂 𝇃 𝇄 𝇅 𝇆 𝇏 𝇇 𝇈 𝇉 𝇊 𝇋 𝇌 𝇍 𝇎 𝇐 𝇑 𝇒 𝇓 𝇔 𝇕 𝇖 𝇗 𝇘 𝇙 𝇚 𝇛 𝇜 𝇝 𝆳 𝆴 𝆵 𝅃 𝅄 𝅅 𝅖 𝅙 𝅆 𝅈 𝅊 𝅌 𝅎 𝅐 𝅒 𝅔 𝅗 𝅚 𝅇 𝅉 𝅋 𝅍 𝅏 𝅑 𝅓 𝅕 𝅘 𝅛 𝅪 𝅫 𝅬 stem 𝅥 𝅦

Road Signs
🛑 ⛔ 🚫 ⚠ ☡ ⛒ ⛌ ⛐ ⛍ ⛛ 🚶 🚷 🚸 ⛖ ⛗ ⛘ ⛙ ⛜ ⛠ ⛡ ⛕ ⛚
Public Signs
♿ ✈ ✆ ☎ ☏ ⛽ ⛾ 🚥 🚦 🚧 🚨 🚬 🚭 🚮 🚯 🚰 🚱 🚲 🚳 🚴 🚵
Industrial Signs
⚛ ☠ ☢ ☣ ⚡ ♻ ♼ ♽ ♲ ♾ ♺ ♳ ♴ ♵ ♶ ♷ ♸ ♹
Bathroom Signs
🚹 🚺 🚻 🚼 🚽 🚾
Airport Signs
🛂 🛃 🛄 🛅
Map Signs
♨ ⛫ ⛬ ⛼ ⛻ ⛯
🚲 🛴 🛵 🛺 🏍 🚕 🚖 🚗 🚘 🚔 🚓 🚙 🚜 🚑 🚒 🏎 ⛟ 🚚 🚛 🚏 🚌 🚍 🚎 🚐 🚉 🚂 🚆 🚄 🚅 🚝 🚃 🚇 🚈 🚊 🚋 🚞 🛤 🚟 🚠 🚡 ⛴ 🚢 ⛵ 🚣 🚤 🛥 🛫 🛬 🛩 ✈ 🛧 🛪 🛨 🛦 🚁 🚀 🛸 🙬 🙭 🙮 🙯
א	ב	ג	ד	ה	ו	
⚛ ☠ ☢ ☣ ⚡ ♻ ♼ ♽ ♲ ♾

fc-list "DejaVu Sans Mono"
/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf: DejaVu Sans Mono:style=Book
https://torinak.com/font/lsfont.html
TTF, 3377 glyphs, 340712 bytes, created: 2016-08-16
2620	☠	☡	☢	☣	☤	☥	☦	☧	☨	☩	☪	☫	☬	☭	☮	☯
2610	☐	☑	☒	☓	☔	☕	☖	☗	☘	☙	☚	☛	☜	☝	☞	☟
₯ℍ≝★➽➤	❡	❢	❣	❤	❥	❦	❧	❨	❩	❪	❫	❬	❭	❮	❯
*/
//La taille de la police semble etre la hauteur d'un caractére en mm mais variable selon la police ... sinon jouer avec l'echelle avant découpage.
text_size=74.0; //[8:0.1:200]

//printer_max_heihgt=190;
//laHauteur=10;//[1:0.1:printer_max_heihgt]

//Hauteur a extruder (mm) (? donc hauteur total = hbase + hextruded ?)
laHauteur=10;//[1:0.1:200]

//La taille de la bordure en mm ajouté en contour des lettres et extruder
tailleBordure = 0.8; //[0.1:0.01:10]

//Epaisseur du socle en mm
laHBase=0.7; //[0.1:0.1:10]

//Faire une base "hull"
haveToHullTheBase=false;

// Choix de la police / font. Pour la liste des font disponible aller sous OpenScad dans "Aide" -> "listes des police"( OpenSCAD embarque "Liberation Mono", "Liberation Sans", "Liberation Serif").
laFont="OpenDyslexicMono Nerd Font:style=Regular"; //["7\\-Segment:style=Regular","Liberation Mono", "Liberation Sans":"Liberation Sans*", "Liberation Serif", "DejaVu Sans Mono", "Arial:style=Gras", "OpenDyslexicMono Nerd Font:style=Regular", "OpenDyslexicAlta Nerd Font Mono:style=Bold Italic", "aakar:style=medium", "Abyssinica SIL:style=Regular", "Andale Mono:style=Regular", "Ani:style=Regular", "AnjaliOldLipi:style=Regular", "Arial Black:style=Regular", "Arial:style=Gras", "Arial:style=Gras Italique", "Arial:style=Italique", "Arial:style=Regular", "Bitstream Charter:style=Bold", "Bitstream Charter:style=Bold Italic", "Bitstream Charter:style=Italic", "Bitstream Charter:style=Regular", "Bookman Uralic:style=Bold", "Bookman Uralic:style=Italic", "Bookman Uralic:style=Regular", "Century Schoolbook L:style=Bold", "Century Schoolbook L:style=Bold Italic", "Century Schoolbook L:style=Italic", "Century Schoolbook L:style=Roman", "Chancery Uralic:style=Italic", "Chandas:style=Regular", "Chilanka:style=Regular", "Comic Sans MS:style=Gras", "Comic Sans MS:style=Regular", "Courier 10 Pitch:style=Bold", "Courier 10 Pitch:style=Bold Italic", "Courier 10 Pitch:style=Italic", "Courier 10 Pitch:style=Regular", "Courier New:style=Gras", "Courier New:style=Gras Italique", "Courier New:style=Italique", "Courier New:style=Regular", "Courier:style=Bold", "Courier:style=Bold Italic", "Courier:style=Italic", "Courier:style=Regular", "DejaVu Math TeX Gyre:style=Regular", "DejaVu Sans Mono:style=Bold", "DejaVu Sans Mono:style=Bold Oblique", "DejaVu Sans Mono:style=Book", "DejaVu Sans Mono:style=Oblique", "DejaVu Sans:style=Bold", "DejaVu Sans:style=Bold Oblique", "DejaVu Sans:style=Book", "DejaVu Sans:style=Condensed", "DejaVu Sans:style=Condensed Bold", "DejaVu Sans:style=Condensed Bold Oblique", "DejaVu Sans:style=Condensed Oblique", "DejaVu Sans:style=ExtraLight", "DejaVu Sans:style=Oblique", "DejaVu Serif:style=Bold", "DejaVu Serif:style=Bold Italic", "DejaVu Serif:style=Book", "DejaVu Serif:style=Condensed", "DejaVu Serif:style=Condensed Bold", "DejaVu Serif:style=Condensed Bold Italic", "DejaVu Serif:style=Condensed Italic", "DejaVu Serif:style=Italic", "Dingbats:style=Regular", "Droid Sans Fallback:style=Regular", "Dyuthi:style=Regular", "FreeMono:style=Gras", "FreeMono:style=Gras Italique", "FreeMono:style=Italique", "FreeMono:style=Regular", "FreeSans:style=Gras", "FreeSans:style=Gras Italique", "FreeSans:style=Italique", "FreeSans:style=Regular", "FreeSerif:style=Gras", "FreeSerif:style=Gras Italique", "FreeSerif:style=Italique", "FreeSerif:style=Regular", "Gargi:style=Regular", "Garuda:style=Bold", "Garuda:style=Bold Oblique", "Garuda:style=Oblique", "Garuda:style=Regular", "GentiumAlt:style=Italic", "GentiumAlt:style=Regular", "Gentium Basic:style=Bold", "Gentium Basic:style=Bold Italic", "Gentium Basic:style=Italic", "Gentium Basic:style=Regular", "Gentium Book Basic:style=Bold", "Gentium Book Basic:style=Bold Italic", "Gentium Book Basic:style=Italic", "Gentium Book Basic:style=Regular", "Gentium:style=Italic", "Gentium:style=Regular", "Georgia:style=Gras", "Georgia:style=Gras Italique", "Georgia:style=Italique", "Georgia:style=Regular", "Gothic Uralic:style=Bold", "Gothic Uralic:style=Regular", "Gubbi:style=Normal", "Impact:style=Regular", "Jamrul:style=Normal", "KacstArt:style=Medium", "KacstBook:style=Medium", "KacstDecorative:style=Medium", "KacstDigital:style=Medium", "KacstFarsi:style=Medium", "KacstLetter:style=Medium", "KacstNaskh:style=Medium", "KacstOffice:style=Medium", "KacstOne:style=Bold", "KacstOne:style=Regular", "KacstPen:style=Medium", "KacstPoster:style=Medium", "KacstQurn:style=Medium", "KacstScreen:style=Medium", "KacstTitleL:style=Medium", "KacstTitle:style=Medium", "Kalapi:style=Regular", "Kalimati:style=Regular", "Karumbi:style=Regular", "Keraleeyam:style=Bold", "Khmer OS:style=Regular", "Khmer OS System:style=Regular", "Kinnari:style=Bold", "Kinnari:style=Bold Italic", "Kinnari:style=Bold Oblique", "Kinnari:style=Italic", "Kinnari:style=Oblique", "Kinnari:style=Regular", "Laksaman:style=Bold", "Laksaman:style=Bold Italic", "Laksaman:style=Italic", "Laksaman:style=Regular", "Latin Modern Math:style=Regular", "Latin Modern Mono Caps:style=10 Oblique", "Latin Modern Mono Caps:style=10 Regular", "Latin Modern Mono Light Cond:style=10 Oblique", "Latin Modern Mono Light Cond:style=10 Regular", "Latin Modern Mono Light:style=10 Bold", "Latin Modern Mono Light:style=10 Bold Oblique", "Latin Modern Mono Light:style=10 Oblique", "Latin Modern Mono Light:style=10 Regular", "Latin Modern Mono Prop Light:style=10 Bold", "Latin Modern Mono Prop Light:style=10 BoldOblique", "Latin Modern Mono Prop Light:style=10 Oblique", "Latin Modern Mono Prop Light:style=10 Regular", "Latin Modern Mono Prop:style=10 Oblique", "Latin Modern Mono Prop:style=10 Regular", "Latin Modern Mono Slanted:style=10 Regular", "Latin Modern Mono:style=10 Italic", "Latin Modern Mono:style=10 Regular", "Latin Modern Mono:style=12 Regular", "Latin Modern Mono:style=8 Regular", "Latin Modern Mono:style=9 Regular", "Latin Modern Roman Caps:style=10 Oblique", "Latin Modern Roman Caps:style=10 Regular", "Latin Modern Roman Demi:style=10 Oblique", "Latin Modern Roman Demi:style=10 Regular", "Latin Modern Roman Dunhill:style=10 Oblique", "Latin Modern Roman Dunhill:style=10 Regular", "Latin Modern Roman Slanted:style=10 Bold", "Latin Modern Roman Slanted:style=10 Regular", "Latin Modern Roman Slanted:style=12 Regular", "Latin Modern Roman Slanted:style=17 Regular", "Latin Modern Roman Slanted:style=8 Regular", "Latin Modern Roman Slanted:style=9 Regular", "Latin Modern Roman:style=10 Bold", "Latin Modern Roman:style=10 Bold Italic", "Latin Modern Roman:style=10 Italic", "Latin Modern Roman:style=10 Regular", "Latin Modern Roman:style=12 Bold", "Latin Modern Roman:style=12 Italic", "Latin Modern Roman:style=12 Regular", "Latin Modern Roman:style=17 Regular", "Latin Modern Roman:style=5 Bold", "Latin Modern Roman:style=5 Regular", "Latin Modern Roman:style=6 Bold", "Latin Modern Roman:style=6 Regular", "Latin Modern Roman:style=7 Bold", "Latin Modern Roman:style=7 Italic", "Latin Modern Roman:style=7 Regular", "Latin Modern Roman:style=8 Bold", "Latin Modern Roman:style=8 Italic", "Latin Modern Roman:style=8 Regular", "Latin Modern Roman:style=9 Bold", "Latin Modern Roman:style=9 Italic", "Latin Modern Roman:style=9 Regular", "Latin Modern Roman Unslanted:style=10 Regular", "Latin Modern Sans Demi Cond:style=10 Oblique", "Latin Modern Sans Demi Cond:style=10 Regular", "Latin Modern Sans Quotation:style=8 Bold", "Latin Modern Sans Quotation:style=8 Bold Oblique", "Latin Modern Sans Quotation:style=8 Oblique", "Latin Modern Sans Quotation:style=8 Regular", "Latin Modern Sans:style=10 Bold", "Latin Modern Sans:style=10 Bold Oblique", "Latin Modern Sans:style=10 Oblique", "Latin Modern Sans:style=10 Regular", "Latin Modern Sans:style=12 Oblique", "Latin Modern Sans:style=12 Regular", "Latin Modern Sans:style=17 Oblique", "Latin Modern Sans:style=17 Regular", "Latin Modern Sans:style=8 Oblique", "Latin Modern Sans:style=8 Regular", "Latin Modern Sans:style=9 Oblique", "Latin Modern Sans:style=9 Regular", "Lato:style=Black", "Lato:style=Black Italic", "Lato:style=Bold", "Lato:style=Bold Italic", "Lato:style=Hairline", "Lato:style=Hairline Italic", "Lato:style=Heavy", "Lato:style=Heavy Italic", "Lato:style=Italic", "Lato:style=Light", "Lato:style=Light Italic", "Lato:style=Medium", "Lato:style=Medium Italic", "Lato:style=Regular", "Lato:style=Semibold", "Lato:style=Semibold Italic", "Lato:style=Thin", "Lato:style=Thin Italic", "Liberation Mono:style=Bold", "Liberation Mono:style=Bold Italic", "Liberation Mono:style=Italic", "Liberation Mono:style=Regular", "Liberation Sans Narrow:style=Bold", "Liberation Sans Narrow:style=Bold Italic", "Liberation Sans Narrow:style=Italic", "Liberation Sans Narrow:style=Regular", "Liberation Sans:style=Bold", "Liberation Sans:style=Bold Italic", "Liberation Sans:style=Italic", "Liberation Sans:style=Regular", "Liberation Serif:style=Bold", "Liberation Serif:style=Bold Italic", "Liberation Serif:style=Italic", "Liberation Serif:style=Regular", "Likhan:style=Normal", "LKLUG:style=Regular", "Lohit Assamese:style=Regular", "Lohit Bengali:style=Regular", "Lohit Devanagari:style=Regular", "Lohit Gujarati:style=Regular", "Lohit Gurmukhi:style=Regular", "Lohit Kannada:style=Regular", "Lohit Malayalam:style=Regular", "Lohit Odia:style=Regular", "Lohit Tamil Classical:style=Regular", "Lohit Tamil:style=Regular", "Lohit Telugu:style=Regular", "Loma:style=Bold", "Loma:style=Bold Oblique", "Loma:style=Oblique", "Loma:style=Regular", "M+ 1c:style=black", "M+ 1c:style=bold", "M+ 1c:style=heavy", "M+ 1c:style=light", "M+ 1c:style=medium", "M+ 1c:style=regular", "M+ 1c:style=thin", "M+ 1mn:style=bold", "M+ 1mn:style=light", "M+ 1mn:style=medium", "M+ 1mn:style=regular", "M+ 1mn:style=thin", "M+ 1m:style=bold", "M+ 1m:style=light", "M+ 1m:style=medium", "M+ 1m:style=regular", "M+ 1m:style=thin", "M+ 1p:style=black", "M+ 1p:style=bold", "M+ 1p:style=heavy", "M+ 1p:style=light", "M+ 1p:style=medium", "M+ 1p:style=regular", "M+ 1p:style=thin", "M+ 2c:style=black", "M+ 2c:style=bold", "M+ 2c:style=heavy", "M+ 2c:style=light", "M+ 2c:style=medium", "M+ 2c:style=regular", "M+ 2c:style=thin", "M+ 2m:style=bold", "M+ 2m:style=light", "M+ 2m:style=medium", "M+ 2m:style=regular", "M+ 2m:style=thin", "M+ 2p:style=black", "M+ 2p:style=bold", "M+ 2p:style=heavy", "M+ 2p:style=light", "M+ 2p:style=medium", "M+ 2p:style=regular", "M+ 2p:style=thin", "Manjari:style=Bold", "Manjari:style=Regular", "Manjari:style=Thin", "Meera:style=Regular", "Mitra Mono:style=Regular", "Mono Uralic:style=Regular", "mry_KacstQurn:style=Regular", "Mukti Narrow:style=Regular", "Nakula:style=Regular", "Navilu:style=Normal", "Nimbus Mono L:style=Bold", "Nimbus Mono L:style=Bold Oblique", "Nimbus Mono L:style=Regular", "Nimbus Mono L:style=Regular Oblique", "Nimbus Roman No9 L:style=Medium", "Nimbus Roman No9 L:style=Medium Italic", "Nimbus Roman No9 L:style=Regular", "Nimbus Roman No9 L:style=Regular Italic", "Nimbus Sans L:style=Bold", "Nimbus Sans L:style=Bold Condensed", "Nimbus Sans L:style=Bold Condensed Italic", "Nimbus Sans L:style=Bold Italic", "Nimbus Sans L:style=Regular", "Nimbus Sans L:style=Regular Condensed", "Nimbus Sans L:style=Regular Condensed Italic", "Nimbus Sans L:style=Regular Italic", "Norasi:style=Bold", "Norasi:style=Bold Italic", "Norasi:style=Bold Oblique", "Norasi:style=Italic", "Norasi:style=Oblique", "Norasi:style=Regular", "Noto Color Emoji:style=Regular", "Noto Mono:style=Regular", "Noto Sans CJK HK:style=Bold", "Noto Sans CJK HK:style=Regular", "Noto Sans CJK JP:style=Bold", "Noto Sans CJK JP:style=Regular", "Noto Sans CJK KR:style=Bold", "Noto Sans CJK KR:style=Regular", "Noto Sans CJK SC:style=Bold", "Noto Sans CJK SC:style=Regular", "Noto Sans CJK TC:style=Bold", "Noto Sans CJK TC:style=Regular", "Noto Sans Mono CJK HK:style=Bold", "Noto Sans Mono CJK HK:style=Regular", "Noto Sans Mono CJK JP:style=Bold", "Noto Sans Mono CJK JP:style=Regular", "Noto Sans Mono CJK KR:style=Bold", "Noto Sans Mono CJK KR:style=Regular", "Noto Sans Mono CJK SC:style=Bold", "Noto Sans Mono CJK SC:style=Regular", "Noto Sans Mono CJK TC:style=Bold", "Noto Sans Mono CJK TC:style=Regular", "Noto Serif CJK JP:style=Bold", "Noto Serif CJK JP:style=Regular", "Noto Serif CJK KR:style=Bold", "Noto Serif CJK KR:style=Regular", "Noto Serif CJK SC:style=Bold", "Noto Serif CJK SC:style=Regular", "Noto Serif CJK TC:style=Bold", "Noto Serif CJK TC:style=Regular", "OpenSymbol:style=Regular", "ori1Uni:style=Medium", "Padauk Book:style=Bold", "Padauk Book:style=Regular", "Padauk:style=Bold", "Padauk:style=Regular", "padmaa-Bold.1.1:style=Bold.1.1", "padmaa:style=Normal", "padmaa:style=regular", "Pagul:style=猀 愀瀀瀀氀", "Palladio Uralic:style=Bold", "Palladio Uralic:style=Italic", "Palladio Uralic:style=Regular", "Phetsarath OT:style=Phetsarath OT", "Pothana2000:style=Regular", "Purisa:style=Bold", "Purisa:style=Bold Oblique", "Purisa:style=Oblique", "Purisa:style=Regular", "Rachana:style=Bold", "Rachana:style=Regular", "RaghuMalayalam:style=Regular", "Rekha:style=Medium", "Roboto Condensed:style=Bold", "Roboto Condensed:style=Bold Italic", "Roboto Condensed:style=Italic", "Roboto Condensed:style=Light", "Roboto Condensed:style=Light Italic", "Roboto Condensed:style=Regular", "Roboto:style=Black", "Roboto:style=Black Italic", "Roboto:style=Bold", "Roboto:style=Bold Italic", "Roboto:style=Italic", "Roboto:style=Light", "Roboto:style=Light Italic", "Roboto:style=Medium", "Roboto:style=Medium Italic", "Roboto:style=Regular", "Roboto:style=Thin", "Roboto:style=Thin Italic", "Roman Uralic:style=Bold", "Roman Uralic:style=Italic", "Roman Uralic:style=Regular", "Saab:style=Regular", "Sahadeva:style=Regular", "Samanata:style=Regular", "Samyak Devanagari:style=Regular", "Samyak Gujarati:style=Regular", "Samyak Malayalam:style=Medium", "Samyak Tamil:style=Regular", "Sans Condensed Uralic:style=Bold", "Sans Condensed Uralic:style=Regular", "Sans Uralic:style=Bold", "Sans Uralic:style=Bold Italic", "Sans Uralic:style=Italic", "Sans Uralic:style=Regular", "Sarai:style=Regular", "Sawasdee:style=Bold", "Sawasdee:style=Bold Oblique", "Sawasdee:style=Oblique", "Sawasdee:style=Regular", "Schoolbook Uralic:style=Bold", "Schoolbook Uralic:style=Italic", "Schoolbook Uralic:style=Regular", "Standard Symbols L:style=Regular", "Suruma:style=Medium", "TeX Gyre Adventor:style=Bold", "TeX Gyre Adventor:style=Bold Italic", "TeX Gyre Adventor:style=Italic", "TeX Gyre Adventor:style=Regular", "TeX Gyre Bonum Math:style=Regular", "TeX Gyre Bonum:style=Bold", "TeX Gyre Bonum:style=Bold Italic", "TeX Gyre Bonum:style=Italic", "TeX Gyre Bonum:style=Regular", "TeX Gyre Chorus:style=Regular", "TeX Gyre Cursor:style=Bold", "TeX Gyre Cursor:style=Bold Italic", "TeX Gyre Cursor:style=Italic", "TeX Gyre Cursor:style=Regular", "TeX Gyre DejaVu Math:style=Regular", "TeX Gyre Heros Cn:style=Bold", "TeX Gyre Heros Cn:style=Bold Italic", "TeX Gyre Heros Cn:style=Italic", "TeX Gyre Heros Cn:style=Regular", "TeX Gyre Heros:style=Bold", "TeX Gyre Heros:style=Bold Italic", "TeX Gyre Heros:style=Italic", "TeX Gyre Heros:style=Regular", "TeX Gyre Pagella Math:style=Regular", "TeX Gyre Pagella:style=Bold", "TeX Gyre Pagella:style=Bold Italic", "TeX Gyre Pagella:style=Italic", "TeX Gyre Pagella:style=Regular", "TeX Gyre Schola Math:style=Regular", "TeX Gyre Schola:style=Bold", "TeX Gyre Schola:style=Bold Italic", "TeX Gyre Schola:style=Italic", "TeX Gyre Schola:style=Regular", "TeX Gyre Termes Math:style=Regular", "TeX Gyre Termes:style=Bold", "TeX Gyre Termes:style=Bold Italic", "TeX Gyre Termes:style=Italic", "TeX Gyre Termes:style=Regular", "Tibetan Machine Uni:style=Regular", "Times New Roman:style=Gras", "Times New Roman:style=Gras Italique", "Times New Roman:style=Italique", "Times New Roman:style=Regular", "Tlwg Mono:style=Bold", "Tlwg Mono:style=Bold Oblique", "Tlwg Mono:style=Oblique", "Tlwg Mono:style=Regular", "Tlwg Typewriter:style=Bold", "Tlwg Typewriter:style=Bold Oblique", "Tlwg Typewriter:style=Oblique", "Tlwg Typewriter:style=Regular", "Tlwg Typist:style=Bold", "Tlwg Typist:style=Bold Oblique", "Tlwg Typist:style=Oblique", "Tlwg Typist:style=Regular", "Tlwg Typo:style=Bold", "Tlwg Typo:style=Bold Oblique", "Tlwg Typo:style=Oblique", "Tlwg Typo:style=Regular", "Trebuchet MS:style=Gras", "Trebuchet MS:style=Gras Italique", "Trebuchet MS:style=Italique", "Trebuchet MS:style=Regular", "Ubuntu Condensed:style=Regular", "Ubuntu Mono:style=Bold", "Ubuntu Mono:style=Bold Italic", "Ubuntu Mono:style=Italic", "Ubuntu Mono:style=Regular", "Ubuntu:style=Bold", "Ubuntu:style=Bold Italic", "Ubuntu:style=Italic", "Ubuntu:style=Light", "Ubuntu:style=Light Italic", "Ubuntu:style=Medium", "Ubuntu:style=Medium Italic", "Ubuntu:style=Regular", "Umpush:style=Bold", "Umpush:style=Bold Oblique", "Umpush:style=Light", "Umpush:style=Light Oblique", "Umpush:style=Oblique", "Umpush:style=Regular", "Uroob:style=Bold", "URW Bookman L:style=Demi Bold", "URW Bookman L:style=Demi Bold Italic", "URW Bookman L:style=Light", "URW Bookman L:style=Light Italic", "URW Chancery L:style=Medium Italic", "URW Gothic L:style=Book", "URW Gothic L:style=Book Oblique", "URW Gothic L:style=Demi", "URW Gothic L:style=Demi Oblique", "URW Palladio L:style=Bold", "URW Palladio L:style=Bold Italic", "URW Palladio L:style=Italic", "URW Palladio L:style=Roman", "Utopia:style=Bold", "Utopia:style=Bold Italic", "Utopia:style=Italic", "Utopia:style=Regular", "Vemana2000:style=Regular", "Verdana:style=Gras", "Verdana:style=Gras Italique", "Verdana:style=Italique", "Verdana:style=Regular", "Waree:style=Bold", "Waree:style=Bold Oblique", "Waree:style=Oblique", "Waree:style=Regular", "Webdings:style=Regular"]

/* //["Arial:style=Gras","Arial Black:style=Regular","Abyssinica SIL:style=Regular","Andale Mono:style=Regular","Comic Sans MS:style=Gras","Ani:style=Regular","DejaVu Sans Mono:style=Book","DejaVu Serif:style=Bold","FreeMono:style=Regular","FreeSans:style=Italique","Georgia:style=Gras Italique","AnjaliOldLipi:style=Regular","Bitstream Charter:style=Regular","Bookman Uralic:style=Regular","Century Schoolbook L:style=Roman","Chandas:style=Regular"]
*/
/*
BUG CRASH avec version snaps 2021.01 ...: 
,"LMMonoCaps10:style=Regular"
,"TeX Gyre Cursor:style=Bold"

La les reste c en fait les gliphes de la font qui ne reprenne pas les codepoint de base ... abcABC
CARRE : ,"KacstScreen:style=Medium"
VIDE : 
*/

//TODO choix si rendu lettre seulement ou avec couvercle ou couvercle seulement
modeRendu="simple";//["simple":"Redu Lettre sans couvercle*","couvercle":"Rendu avec Couvercle Empilé","couvercleRotated":"Rendu avec Couvercle Non Empilé (rotation au dessus ...)","onlyCouvercle":"Rendu seulement du Couvercle"]
//todo // TODO a revoire cf pas tres coherent pour les nomage de var utilisé (en un sens inverse le role de h extrud et de h bas et créer une bordure non util ...)et a utiliser pour le couvercle ?... et revision pour utiliser cela en fonction ?
isModeTampon = false;

le_scale=1; //[-1:0.1:5]// SSI centré et pas pour des bordure d'épaiseur constante ... si >1 icompatible avec une notion de couvercle emboitable.

text_halign="left";//["left":"left*","center","right"]
text_valign="baseline";//[ "top", "center", "baseline":"baseline*","bottom"]
text_spacing=1.0;//[0:0.1:5]
text_direction="ltr";//[ "ltr":"ltr (left-to-right)*", "rtl": "rtl (right-to-left)", "ttb": "ttb (top-to-bottom)", "btt": "btt (bottom-to-top)"]
text_language="en";// //["en":"en*"]//? fr ru ...
text_script="latin";//[]

//Petit ecart a ajouter pour faciliter l'enboitement pour ne pas avoir a utiliser l expanction horizontal / XY correction
tolerance = 0.3;//[0:0.01:1]

// Pour avoir plus de nombre de segment et donc des courbes plus lissés ( un multiple de 4 pour des raisons ? du language interprété openscad ! )
//$fn = 72; //[0:4:128] 
$fn = 52; //[0:4:128] 

/* [Couleur vue] */
// Pour en debug(todo) différencier visuellement le couvercle du reste ...
Couvercle_Couleur = "yellow";//["blue","green","yellow"]
// Pour en debug(todo) avoir une transparance
Couvercle_Couleur_Alpha = 0.3;//[0:0.01:1]

/* [Extrude Twist BUG] */

//BUG extrude twistValue no twist = 0 DEBUG TODO calage en mode couvercle superposé ? cf ???
extrde_twist_value=0;//[0:0.1:90]

//BUG vs logic si on twist sans utiliser plusieur tranches on arrive a des effect de courbure comme avec le twist d'un tube flexible cf les droite du Point A a A' créer une surface courbe car transformation twist ... cf hyperbolique ... 
extrde_twist_slices=1;//[1:1:100]

/* [Limite Plateau] */
plate_voir_limites_volume = true;
plate_size_x=200;
plate_size_y=200;
plate_size_z=190;

/* [Hidden] */
// ici les "variables openscad" (qui serai plus des Constances)  "non util a", ou "a ne pas rendre", paramétrablent / modifiablent.

/**
TODO trouver si l'on peus simplement formater les texte de sortie ... enlever le ':' des fonts en sortie ...
*/
echo(str( "debug : ","laFont=",laFont) );

tmpFileNameLabel="Nom de fichier .stl TODO a formater : \n";
// 
tmpFileName = str( "","EText=",leTexte,"_HP=",text_size,"_H=",laHauteur,"_E=",tailleBordure,"_S=",laHBase,"_",laFont,".stl");


// sanity check // assert(condition, message); 
// Count has to be a positive integer greater 0
//    assert(cnt > 0);

/* Fonction recursive pour obtenir une chaine de texte utilisable comme nom de fichier.
actuelement remplace les ':' par '_'
TODO pas de "/" ni de "\" ' " et aussi "non imprimabe" != ord(c) et != "problèmatique si en fat32"
? se limiter au ascii de base ou au unicode \xFF ou \uFFFF mais pas jusqua \UFFFFFF.
parametres :
@arg t String chaine d'origine
@arg pos Integer la position en cours (pour permmetre via les appel recursif a partourier le chaine et avoir une condition de terminaison ..
?@todo r String ensemble des caracteres a remplacer
@arg c_remp String le "caractére" de rempalcement
*/
function tClean(t,pos=0,c_remp="_") = 
(t == undef) ? "" :
(pos<len(t)) ? str
( t[pos] == ":" ? c_remp : t[pos] , tClean(t,pos+1) 

) : ""
;

echo (str("\n",tClean(tmpFileName),"\n"));

// Pour debug(todo) et/ou verbose(todo) mode : comment identifier le fichier de la font en cours d'utilisation et avoir un moyen de visualiser les gliphes disponible.
echo (str("\nfc-list \"",laFont,"\"\nhttps://torinak.com/font/lsfont.html\n"));
 /*
    
    font="Liberation Sans:style=Bold Italic"
The font list dialog (available under Help > Font List) shows the font name and the font style for each available font. For reference, the dialog also displays the location of the font file. You can drag a font in the font list, into the editor window to use in the text() statement.
    */
    
module My2DObjectModule()
{
    if ( use_dfx_file )
        {
       /*     scale([le_fichier_dxf_ratio,le_fichier_dxf_ratio,1])
            */
            //DEBUG echo (str("using dxf file : ",le_fichier_dxf)); // Pas ici car de multiple appel ...
            import(le_fichier_dxf);
        }
    else
    {
            //DEBUG echo (str("using texte : ",leTexte));// Pas ici car de multiple appel ...
            text
            ( leTexte
            , size = text_size
            , halign = text_halign
            , valign = text_valign
            , font = laFont
            , spacing = text_spacing // 1.2 ?Ko si twist car centrage décalè ...
            ,direction=text_direction
            ,language=text_language
            ,script=text_script
            );
        
        }
}


if (
    $preview // car en 2D si present empeche le rendu des element 3D
//|| 
//true
) {
    
InDefautFont();
}
module InDefautFont(){
    
   
        # // Debug modifieur pour mettre en pink mais reste un objet "normal"
    text
            ( leTexte
            , size = text_size
            , halign = text_halign
            , valign = text_valign
           // , font = laFont
            , spacing = text_spacing // 1.2 ?Ko si twist car centrage décalè ...
            ,direction=text_direction
            ,language=text_language
            ,script=text_script
            );
}

// TODO correctif pour les différent mode de rendu.
if ( modeRendu == "simple" ){
    //echo (str("Rendu MODE SIMPLE"));
}else{
    //echo (str("RENDU NON MODE SIMPLE"));
}

if ( haveToHullTheBase ){
    //echo (str("haveToHullTheBase"));
}else{
    //echo (str("not haveToHullTheBase"));
}


/*

TODO a revoir actuellement extrude une bordure ajouté a l'extérieur et donc cela créer un genre de mise en gras ... voir pour plutot mettre une bordure vers l'intérieur et ou la répartire ex : 50/50.
*/


/**
Revision complete pour d'autre mode 
et ? l'utilisation des pseudo var vs l'exlusion d'un modificateur
Si par exepmle je ne veux plus de l'offset faut t'il le mettre avec r=0 ou trouver une autre methode pour ne pas l'utiliser (cf creation d'un autre module (pas top niveu factorisation du code...)
Comment structurer ? via des fonctions qui embarque la logique pour chaque parametre des modificateur utilisé ou mettre la logique if / else ici ...

*/
module myExtrudetedTextEssai1BaseSocle()
{
    bltwist = 
    (extrde_twist_value/laHauteur)*laHBase;
    //0;
    
    linear_extrude(height = (!isModeTampon ? laHBase: laHauteur+laHBase), twist = bltwist, slices = 1 
    //,scale=5
    )
     offset(r = (!isModeTampon ? ((tailleBordure*2)+tolerance) : 0 )) // Todo *2 ssi socle pour couvercle ?
      My2DObjectModule();
}


module myExtrudetedTextEssai1()
{
    MultiRange()
    {
        linear_extrude
        (height = laHauteur
        , twist = extrde_twist_value
        , slices = extrde_twist_slices
        ,scale = le_scale
        )
        {
            difference()
            {
                offset(r = tailleBordure)
                My2DObjectModule();
                offset(r = 0)
                My2DObjectModule();
            }
        }
        // pour le socle
        if ( haveToHullTheBase )
            {
                //  echo (str("haveToHullTheBase"));
                hull()
                {
                    myExtrudetedTextEssai1BaseSocle();
                }
            }
        else
            {
                //echo (str("not haveToHullTheBase"));
                myExtrudetedTextEssai1BaseSocle();
            }
    }
}


//Multiple ranges
module MultiRange(){
    if ($children>1){
        color("lightblue") children([0:1]);
    }
    if ($children>2){
        color("lightgreen")children([2:$children-2]);
    }
   color("lightpink") children($children-1);
}


module myExtrudetedTextEssaiCouvercle()
{    
    MultiRange()
{
    linear_extrude(height = laHauteur 
    //- laHBase // a commenter sinon manque de hauteur pour le couvercle ... !?
    , twist = extrde_twist_value, slices = extrde_twist_slices) 
    {
        difference() 
        {     
            offset(r = ((tailleBordure*2)+tolerance))            
               rotate([0,180,
            extrde_twist_value
            +hltwist//Sinon pas bien superposé
            ])  My2DObjectModule();            
            offset(r = tailleBordure+tolerance)        
               rotate([0,180,extrde_twist_value
            +hltwist//Sinon pas bien superposé
            ])  My2DObjectModule();            
       }
   }
   
   
   
   
// pour le haut du couvercle
hltwist = 
    (extrde_twist_value/laHauteur)*laHBase;//pour tiwister aussi le haute proportionnellement...
linear_extrude(height = laHBase, twist = hltwist, 
slices = 1 //todo un nb de couche proportionel au nb de c du twiste
) 
{
    offset(r = ((tailleBordure*2)+tolerance)) 
    rotate([0,180,extrde_twist_value+hltwist])  My2DObjectModule();
    
}
   
   
   
}

}
 
if ( modeRendu == "simple" )
    {
        //echo (str("Rendu MODE SIMPLE"));
        myExtrudetedTextEssai1();
    }
else if (modeRendu == "couvercle")
    {
        //echo (str("RENDU MODE SIMPLE et couvercle"));
        myExtrudetedTextEssai1();
        color(Couvercle_Couleur,Couvercle_Couleur_Alpha)
        translate([0,0,1*(laHBase+laHauteur
        +0.1//Todo a commenter ou a revoir pour parametrabel
        )])
        rotate([0,180,0])
        // translate([0,0,-1*(laHBase+laHauteur+1)])
        //translate([0,text_size*1.3,0])
        myExtrudetedTextEssaiCouvercle();
    }
else if (modeRendu == "couvercleRotated")
    {
        //couvercleRotated
        //echo (str("RENDU MODE SIMPLE et couvercleRotated"));
        myExtrudetedTextEssai1();
        //color(Couvercle_Couleur,Couvercle_Couleur_Alpha)
        // rotate([0,180,0])
        //translate([0,0,-1*(laHBase+laHauteur+1)])
        translate([0,text_size*1.4,0])
        myExtrudetedTextEssaiCouvercle();
    }
else if (modeRendu == "onlyCouvercle")
    {
        //echo (str("RENDU MODE only couvercle"));
       // color(Couvercle_Couleur,Couvercle_Couleur_Alpha)
        // rotate([0,180,0])
        translate([0,0,-1*(laHBase+laHauteur+1)])
        //translate([0,text_size*1.3,0])
        myExtrudetedTextEssaiCouvercle();
    }
else
    {
        echo ( str ("mode TODO : ",modeRendu," !!!"));
    }

// visualiser les limite de la zone d'impression cf : plate_size_x, y , z
    
    module volume_impression(dim_x, dim_y, dim_z){
        color("blue"
        ,0.0 // transparance a 100% mais si en mode d'affichage avec arretes visible alors on a les limites ...
        )
        % // modificateur pour afficher en previsualisation, mais ne pas utiliser en rendu ...
        cube([dim_x,dim_y,dim_z]
        //, center=true // centre aussi en Z ...
        );
        
    }
    if ( plate_voir_limites_volume 
    //    && $preview 
    )
    volume_impression(dim_x=plate_size_x, dim_y=plate_size_y, dim_z=plate_size_z);