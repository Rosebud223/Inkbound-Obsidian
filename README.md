# Inkbound Obsidian
A horror adjascent creature collection game

Main scene: game_controller.tscn
- Map container holds current map.
	- there are 2 maps, catacomb2 and catacomb1.
	- map change is handled by the game_controller.gd script attached to the main node in game_controller.tscn
- Menu canvas contains and resizes the main menu scene


Map scenes: Catacomb1, Catacomb2
- Contains Node2d that holds all tile layers: Ground, wall, details, doors and a ysort layer 
	(The ysort previously held all objects intended as interactable but I dont think that will work)
	- Ground and Wall layers provide most of the collisions
- Contains a creature scene. This is Toed. Toed is fabulous sometimes
- Contains an instance of Character (playable character)
	- Character has a camera that determines the zoom and is custom set to the boundaries of the map
		(im sure there's a better way to do this but I haven't found it yet.)
- Catacomb1 has 2 additions. 
	- There is a transition area that handled by the world.gd script. This is how the scenes transition, mostly
	- There is an actionable item on the creature. This is how the character is able to talk to it
		(i have deleted the hat to make it better)


Characters (Character.tscn and Creature.tscn)
- Creature is less complex. It contains an animated sprite, a simple script (creature.gd) that allows animation, and collision
	(y sort is handled in the map)
- Character contains the same things as creature, but the character script handles movement and various animations
	- Character also contains an actionable finder. The tutorial I watched had a different setup so Direction probably isnt needed


Helpers: Actionable and Collectable
- Actionable really just connects input to dialogue.
  TODO: Collectable wasnt finished, but it was going to work like actionable to make interaction and collection work


Objects:
 TODO: I think I need this to make collectable objects


UI: (main_menu.tscn)
- Main is a controller node with 2 panels, options and main.
- Both contain elements that have function or some sorting ability. 
- There's an audio control on options.
- main_menu.gd handles the interactions between main panel and options panel.
	audio_control.gd handles volume. connects to AudioStreamPlayer
	TODO: I want to add another function for fullscreen or changing screen resolution


Dialogue: 
	Made from an addon for dialogue
	- contains balloon.gd that is an automatically generated script
	- main.dialogue handles all the actuall dialogues
	- balloon.tscn is the mildly customized style for dialogue bubbles. Handled by ballon.gd


Assets:
	Audio (contains songs)
	Fonds (contains fonts. I dont need half of them)
	Graphics:
		Characters: Has stuff for Toed and Caterpeeper. 
			Toed only has 2 animations.
			Caterpeeper has idle, blink, walk forward and walk backwards. I want to add a lot more for each direction
		Props: contains a hat and a sprite sheet for a few props that I will probably replace
		Tilesets: only contains cryptTileMap right now. 
		UI: Contains custom graphics for the UI. I might not be able to use most of it
	Themes: custom look for UI elements