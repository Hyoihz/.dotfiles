/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "JetBrains Mono Nerd Font:style=medium:pixelsize=16:antialias=true:autohint=true"
};

static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static const unsigned int baralpha = 0xd0;
static const unsigned int baralpha2 = 255;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha2, borderalpha },
	[SchemeSelHighlight] = { OPAQUE, baralpha2, borderalpha },
	[SchemeNormHighlight] = { OPAQUE, baralpha, borderalpha },
	[SchemeOut] = { OPAQUE, baralpha, borderalpha },
};

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
    [SchemeNorm] = { "#cdd6f4", "#1e1e2e" },
	[SchemeSel] = { "#1e1e2e", "#89dceb" },
	[SchemeOut] = { "#000000", "#89dceb" },
	[SchemeNormHighlight] = { "#F9E2AF", "#1E1E2E" },
	[SchemeSelHighlight] = { "#A6E3A1", "#585B70" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
