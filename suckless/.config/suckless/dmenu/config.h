/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
static unsigned int border_width = 0;
static const unsigned int alpha = 235;
/* -fn option overrides fonts[0]; default X11 font or font set */
static char font[] = "JetBrainsMonoMedium Nerd Font:style=Regular:size=10";
static const char *fonts[] = {
    font,
	"JetBrainsMonoMedium Nerd Font:style=Regular:size=10"
};
//static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
//static const char *colors[SchemeLast][2] = {
//	/*     fg         bg       */
//	[SchemeNorm] = { "#ebdbb2", "#1d2021" },
//	[SchemeSel] = { "#d8a657", "#32302f" },
//	[SchemeSelHighlight] = { "#1d2021", "#d8a657" },
//	[SchemeNormHighlight] = { "#ea6962", "#1d2021" },
//	[SchemeOut] = { "#1d2021", "#7daea3" },
//	[SchemeOutHighlight] = { "#1d2021", "#d8a657" },
//};

static char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static char normfgcolor[] = "#ebdbb2";
static char normbgcolor[] = "#1d2021";
static char selfgcolor[]  = "#32302f";
static char selbgcolor[]  = "#d8a657";
static char *colors[SchemeLast][2] = {
                    /*     fg         bg       */
	[SchemeNorm] = { normfgcolor, normbgcolor },
	[SchemeSel]  = { selfgcolor,  selbgcolor  },
	[SchemeOut]  = { "#1d2021",   "#7daea3" },
 };

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel] = { OPAQUE, alpha },
	[SchemeOut] = { OPAQUE, alpha },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
	{ "font",        STRING, &font },
	{ "normfgcolor", STRING, &normfgcolor },
	{ "normbgcolor", STRING, &normbgcolor },
	{ "selfgcolor",  STRING, &selfgcolor },
	{ "selbgcolor",  STRING, &selbgcolor },
	{ "prompt",      STRING, &prompt },
};
