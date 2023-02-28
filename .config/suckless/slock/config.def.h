/* user and group to drop privileges to */
static const char *user  = "dlan";
static const char *group = "users";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#6c7086",   /* during input */
	[FAILED] = "#eba0ac",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
