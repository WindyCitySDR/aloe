modules:
{

	crc_tb:
	{
		binary="modrep_osld/libgen_crc.so";
		mopts=6;
		variables=({name="long_crc";value=16;});
	};	

	coder:
	{
		binary="modrep_osld/liblte_turbocode.so";	
		mopts=12;
		variables=({name="direction";value=0},{name="padding";value=0;});
	};
	
	ratematching:
	{
		binary="modrep_osld/liblte_ratematching.so";	
		mopts=23;
		variables=(
			{name="direction";value=0},{name="out_len";value=0},
			{name="rvidx";value=0;}
		);
	};

	scrambling:
	{
		binary="modrep_osld/liblte_scrambling.so";	
		mopts=11;
		variables=({name="tslot_idx";value=0},{name="q";value=0;},{name="cell_gr";value=2},{name="cell_sec";value=0});
	};

	modulator:
	{
		binary="modrep_osld/libgen_modulator.so";	
		mopts=11;
		variables=({name="modulation";value=1;});
	};

	
};


interfaces:
(
	{src="_input";dest="crc_tb"},
	{src="crc_tb";dest="coder"},
	{src="coder";dest="ratematching"},	
	{src="ratematching";dest="scrambling"},	
	{src="scrambling";dest="modulator"},		
	{src="modulator";dest="_output"}
);
