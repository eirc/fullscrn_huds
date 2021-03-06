extend Class SpecialHereticStatusBar
{
	mixin CompatFunctions;
	mixin PowerupValues;

	// ===================================
	// Special HUDS for certain PWADS/mods
	// ===================================
	void setBARBACKNames()
	{
		// Defaults
		SMALLIN = "SMALLIN";
		SMALLGR = "SMALLGR";

		BARBACK = "BARBACK";
		LTFCTOP = "LTFCTOP";
		RTFCTOP = "RTFCTOP";
		GOD1    = "GOD1";
		GOD2    = "GOD2";

		// Deal with compatibility with certain PWADS
		switch(BARBACK_HASH)
		{
		case '2fb519e3fe1b5cc6f15f9284e35222a4': // Heretic Neural Texture Pack
			BARBACK = "BARBACK_NEURAL";
			LTFCTOP = "LTFCTOP_NEURAL";
			RTFCTOP = "RTFCTOP_NEURAL";
			GOD1    = "GOD1_NEURAL";
			GOD2    = "GOD2_NEURAL";
			break;
		case 'c8aa060df2dabd11d451598c80d190d9': // Curse of D'Sparil
			BARBACK = "BARB_CUR";
			GOD1    = "GOD1_CUR";
			GOD2    = "GOD2_CUR";
			break;
		}
	}
}