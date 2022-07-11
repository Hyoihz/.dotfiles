/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const Gap default_gap        = {.isgap = 1, .realgap = 10, .gappx = 10};
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 4;   /* systray spacing */
static const unsigned int systrayiconsize = 16; /* systray icon size in px */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;     /* 0 means no bar */
static const int user_bh            = 22;    /* 2 is the default spacing around the bar's font */
static const int topbar             = 1;     /* 0 means bottom bar */
static const char *fonts[]          = {	
    "JetBrains Mono Medium Nerd Font:pixelsize=14:antialias=true:autohint=true", 
    "Material Design Icons Desktop:style=medium:pixelsize=14:antialias=true:autohint=true",
    "Noto Color Emoji:pixelsize=12:antialias=true:autohint=true"
};
static const char dmenufont[]       = "JetBrains Mono Medium Nerd Font:pixelsize=16:antialias=true:autohint=true";
static const char col_gray1[]       = "#1a1b26";
static const char col_gray2[]       = "#db4b4b";
static const char col_gray3[]       = "#c0caf5";
static const char col_gray4[]       = "#a9b1d6";
static const char col1[]            = "#e0af68";
static const char col2[]            = "#7aa2f7";
static const char col3[]            = "#9ece6a";
static const char col4[]            = "#bb9af7";
static const char col5[]            = "#bb9af7";
static const char col6[]            = "#bb9af7";

enum { SchemeNorm, SchemeCol1, SchemeCol2, SchemeCol3, SchemeCol4,
       SchemeCol5, SchemeCol6, SchemeSel }; /* color schemes */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm]  = { col_gray3, col_gray1, col_gray1 },
	[SchemeCol1]  = { col1,      col_gray1, col_gray2 },
	[SchemeCol2]  = { col2,      col_gray1, col_gray2 },
	[SchemeCol3]  = { col3,      col_gray1, col_gray2 },
	[SchemeCol4]  = { col4,      col_gray1, col_gray2 },
	[SchemeCol5]  = { col5,      col_gray1, col_gray2 },
	[SchemeCol6]  = { col6,      col_gray1, col_gray2 },
	[SchemeSel]   = { col_gray4, col_gray1, col_gray2 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_gray2, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key             function             argument */
	{ MODKEY,                       XK_p,           spawn,               {.v = dmenucmd } },
	{ MODKEY,                       XK_Return,      spawn,               {.v = termcmd } },
	{ MODKEY,                       XK_b,           togglebar,           {0} },
   	{ MODKEY,                       XK_h,           focusdir,            {.i = 0 } }, // left
	{ MODKEY,                       XK_j,           focusdir,            {.i = 3 } }, // down
	{ MODKEY,                       XK_k,           focusdir,            {.i = 2 } }, // up
	{ MODKEY,                       XK_l,           focusdir,            {.i = 1 } }, // right
 	{ MODKEY|ShiftMask,             XK_h,           placedir,            {.i = 0 } }, // left
 	{ MODKEY|ShiftMask,             XK_j,           placedir,            {.i = 3 } }, // down
 	{ MODKEY|ShiftMask,             XK_k,           placedir,            {.i = 2 } }, // up
 	{ MODKEY|ShiftMask,             XK_l,           placedir,            {.i = 1 } }, // right
	{ MODKEY,                       XK_i,           incnmaster,          {.i = +1 } },
	{ MODKEY,                       XK_d,           incnmaster,          {.i = -1 } },
	{ MODKEY,                       XK_Left,        setmfact,            {.f = -0.05} },
	{ MODKEY,                       XK_Right,       setmfact,            {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return,      zoom,                {0} },
	{ MODKEY,                       XK_Tab,         view,                {0} },
	{ MODKEY,                       XK_q,           killclient,          {0} },
	{ MODKEY,                       XK_t,           setlayout,           {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,           setlayout,           {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,           setlayout,           {.v = &layouts[2]} },
    { MODKEY,                       XK_r,           resetlayout,         {0} },
	{ MODKEY,                       XK_space,       setlayout,           {0} },
	{ MODKEY|ShiftMask,             XK_space,       togglefloating,      {0} },
	{ MODKEY,                       XK_f,           togglefullscreen,    {0} },
	{ MODKEY,                       XK_0,           view,                {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,           tag,                 {.ui = ~0 } },
	{ MODKEY,                       XK_comma,       focusmon,            {.i = -1 } },
	{ MODKEY,                       XK_period,      focusmon,            {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,       tagmon,              {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,      tagmon,              {.i = +1 } },
   	{ MODKEY,                       XK_c,           movecenter,          {0} },
	{ MODKEY,                       XK_minus,       setgaps,             {.i = -5 } },
	{ MODKEY,                       XK_equal,       setgaps,             {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_minus,       setgaps,             {.i = GAP_RESET } },
	{ MODKEY|ShiftMask,             XK_equal,       setgaps,             {.i = GAP_TOGGLE} },
    { Mod1Mask,                     XK_Alt_R,       spawn,               SHCMD("brillo -U 5 -q; kill -35 $(pidof dwmblocks)") }, 
    { Mod1Mask,                     XK_Control_R,   spawn,               SHCMD("brillo -A 5 -q; kill -35 $(pidof dwmblocks)") }, 
    { Mod1Mask,                     XK_slash,       spawn,               SHCMD("pamixer -ui 5; kill -36 $(pidof dwmblocks)") }, 
    { Mod1Mask,                     XK_Menu,        spawn,               SHCMD("pamixer -ud 5; kill -36 $(pidof dwmblocks)") }, 
	TAGKEYS(                        XK_1,                                0)
	TAGKEYS(                        XK_2,                                1)
	TAGKEYS(                        XK_3,                                2)
	TAGKEYS(                        XK_4,                                3)
	TAGKEYS(                        XK_5,                                4)
	TAGKEYS(                        XK_6,                                5)
	TAGKEYS(                        XK_7,                                6)
	TAGKEYS(                        XK_8,                                7)
	TAGKEYS(                        XK_9,                                8)
	{ MODKEY|ShiftMask,             XK_q,           quit,                {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
    { ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

