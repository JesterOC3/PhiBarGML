/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_set_color(c_white)
draw_arrow(x,y+16, x+(MAIN*5),y+16,8);
draw_arrow(x,y+16, x+(SECOND*5),y+16,8);

draw_arrow(x,y+16, x+((calcPhihope(MAIN,SECOND))*5),y+16,8);

draw_set_font(Font1)

var COLMAIN = make_color_hsv(MAIN, 255,150);
draw_text_color(x,y+64,$" MAIN HUE = {MAIN}", COLMAIN,COLMAIN,COLMAIN,COLMAIN,1);

var COLSECOND = make_color_hsv(SECOND, 255,150);
draw_text_color(x,y+128,$" SECOND HUE = {SECOND}", COLSECOND,COLSECOND,COLSECOND,COLSECOND,1);

//I don't like having object nor obfuscate.
var MAINCALC = calcPhihope(MAIN,SECOND);
var COLp_HI = make_color_hsv(MAINCALC, 255,150);
draw_text_color(x,y+192,$" PHI CALC HUE = { MAINCALC}", COLp_HI,COLp_HI,COLp_HI,COLp_HI,1);



draw_text( mouse_x,mouse_y,$" { (mouse_x div 5)-camera_get_view_x(cam) }")


















