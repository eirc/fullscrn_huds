extend Class SpecialDoomStatusBar
{
	enum FontValues
	{
		OLDFONT = 0,
		NEWCONFONT = 1,
		MM2 = 2,
		SOLIDFONT = 3,
		ZDOOM = 4
	}
	
	struct StatFont
	{
		Font fnt; // The Font
		int tHeight; // Height from top (for top-left and top-right)
		int bHeight; // Height from bottom (for bottom-left and bottom-right)
		int sPush; // Push from edge of screen
		vector2 scale; // Scaling for the text; larger x-values shrink horizontally, larger y-values shrink vertically
		int padding; // Space padding to add
		int vspace; // Space between stats
	}
	
	void GetStatFont(out statFont s)
	{
		switch(statsFont.GetInt())
		{
		default:
		case OLDFONT:
			s.fnt = "OLDFONT";
			s.tHeight = 2;
			s.bHeight = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			break;
		case NEWCONFONT:
			s.fnt = "NewConsoleFont";
			s.tHeight = 2;
			s.bHeight = 78;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		case MM2:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeight = 86;
			s.scale = (700,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		case SOLIDFONT:
			s.fnt = "SOLID";
			s.tHeight = 2;
			s.bHeight = 87;
			s.scale = (910,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		case ZDOOM:
			s.fnt = "ZDOOM";
			s.tHeight = 2;
			s.bHeight = 90;
			s.scale = (910,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		}
	}
}