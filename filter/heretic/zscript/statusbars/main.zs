Class SpecialHereticStatusBar : HereticStatusBar
{
	transient CVar splitHUD;
	transient CVar alphaValue;
	transient CVar alphaOpaque;
	
	transient CVAR boomColors;
	transient CVAR splitArms;
	transient CVAR automapHide;
	
	transient CVAR statsType;
	transient CVAR statsFont;
	transient CVAR statsCompColor;
	transient CVAR statKills;
	transient CVAR statSecrets;
	transient CVAR statItems;
	transient CVAR statTime;
	transient CVAR statPowerups;

	int chainWig; // wiggle is private...

	// Strings describing certain font-related things
	string SMALLIN;
	string SMALLGR;
	
	override void Init()
	{
		Super.Init();
		
		splitHUD    = CVar.FindCVar("fullhud_split");
		alphaValue  = CVar.FindCVar("fullhud_trans");
		alphaOpaque = CVar.FindCVar("fullhud_opaque");
		
		boomColors  = CVar.FindCVar("fullhud_boomcolors");
		splitArms   = CVar.FindCVar("fullhud_splitarms");
		automapHide = CVar.FindCVar("fullhud_automaphide");
		
		statsType      = CVar.FindCVar("fullhud_stats_type");
		statsFont      = CVar.FindCVar("fullhud_stats_font");
		statsCompColor = CVar.FindCVar("fullhud_stats_comp");
		statKills      = CVar.FindCVar("fullhud_stats_kills");
		statSecrets    = CVar.FindCVar("fullhud_stats_secrets");
		statItems      = CVar.FindCVar("fullhud_stats_items");
		statTime       = CVar.FindCVar("fullhud_stats_time");
		statPowerups   = CVar.FindCVar("fullhud_stats_powerups");

		SMALLIN = "SMALLIN";
		SMALLGR = "SMALLGR";

		statInit();
	}

	override void NewGame()
	{
		Super.NewGame();

		PowerupNames.clear();
		PowerupDisplay.clear();
		statNewGame();
	}
	
	override void Tick()
	{
		Super.Tick();
		mHealthInterpolator.Update(CPlayer.health);

		// wiggle the chain if it moves
		if (Level.time & 1)
		{
			chainWig = (mHealthInterpolator.GetValue() != CPlayer.health) && Random[ChainWiggle](0, 1);
		}

		statTick();
	}

	override void Draw (int state, double TicFrac)
	{
		BaseStatusBar.Draw (state, TicFrac);
		
		StatFont sfnt;
		getStatFont(sfnt);
		if(PowerupNames.size() == 0) setPowerupNames();

		if (state == HUD_StatusBar)
		{
			if(!(automapactive && automapHide.GetInt()))
			{
				SetSize(42, 320, 200);
				BeginStatusBar();
				DrawMainBar (TicFrac);
				if(!automapactive) DrawLevelStats (sfnt,state);
			}
			else // Hide HUD on Automap
				SetSize(0, 320, 200);
		}
		else if (state == HUD_Fullscreen)
		{
			BeginHUD();
			DrawFullScreenStuff();
			DrawLevelStats (sfnt,state);
		}
	}

	protected void DrawFullScreenStuff ()
	{
		if(splitHUD.getint())
			DrawSplit();
		else
			DrawUnsplit();
	}

	// ================================
	// Concatenate two strings together
	// ================================
	string concat(string s1, string s2)
	{
		return string.format("%s%s",s1,s2);
	}
}