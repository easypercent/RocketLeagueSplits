state("RocketLeague")
{
    int rings: 0x022BF768, 0x148, 0x198, 0xE0;
}

startup
{
    settings.Add("on", true, "Toggle the autosplitter on/off");
}

update
{
    if (!settings["on"]) return;

    if (current.rings < 0 || current.rings > 170) 
    {
        return;
    }
}

start
{
    if (current.rings == 1 && old.rings != 1)
    {
        return true;
    }
}

split
{
    // normal splits
    if (current.rings != old.rings && current.rings % 10 == 0)
    {
        return true;
    }
    // last split
    if (old.rings == 161 && current.rings == 0)
    {
        return true;
    }
}