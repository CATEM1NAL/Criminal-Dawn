If you're interested enough in this mod to create a translation for your own language, first of all, thank you!

Second of all, there's a few things to note about how these localization files are used:

ponr: the mod expects the correct number of rare PONR messages to exist, any less and it will pull
      invalid strings. If you don't have ideas you can just duplicate existing PONR messages to fill
      them out. Also, message length is a MAJOR consideration for these. If the message is too long it
      will be cut off by the default HUD, so make sure to test longer messages. You can do this by
      going to lua/ponr.lua:16 and changing "crimdawn_ponr_default" to "crimdawn_ponr_rareX" (where X is
      the number of the string you want to test).

menu: the current run is dynamically created through code. "crimdawn_first_run_title" is used exclusively
      at the very start of the very first run, and is never shown again after clicking the button. The
      other variations of the start run button are not currently exposed through these files, which I
      understand may be annoying and potentially problematic if a language uses different grammar rules
      (instead of "17th Criminal Dawn" it's expected to say "Criminal Dawn 17th", for example). This is
      something I'd like to look into, but it's a very low priority for now.

To start making your own translation, just copy the "en" folder and rename it to match your language.
Then you have to go through the process of actually translating every single line (I'm so sorry).
To test if the translation works you can edit "main.xml" and edit the block that looks like this:
<loc file="en/menu.json" language="english"/>
to match the language you're adding:
<loc file="fr/menu.json" language="french"/>

Once the translation is done and everything is working, you can open a pull request on GitHub or send
me the folder directly so I can check it and add it to the mod.