//Shoutout to WigglerCola and Jsburg y'all the real g's

#define init
global.killsUntilCool = 3;
global.funnySound = sound_add("funnysound.ogg");

#define step
//If you have bolt marrow, you have to kill more with one bolt for it to be cool
if(skill_get(21))
	global.killsUntilCool = 7;

//Thank you WigglerCola :)
with(Bolt){ if "kills" not in self { kills = 0 } }
with(HeavyBolt){ if "heavyKills" not in self { heavyKills = 0 } }
with(ToxicBolt){ if "toxicKills" not in self { toxicKills = 0 } }
with(UltraBolt){ if "ultraKills" not in self { ultraKills = 0 } }

with (Bolt) {
	if(instance_exists(enemy))
	{
		//Thank you Jsburg too :)
		with (enemy) if (my_health <= 0) 
		{ 
			Bolt.kills += 1;
			//trace(Bolt.kills); // Just for testing
			//Plays the TF2 Machina penetration sound effect if you get a lot of people with one bolt
			if(Bolt.kills >= global.killsUntilCool){
				audio_play_sound(global.funnySound, 100, false);
				Bolt.kills = 0;
			}				
		}
	}
}

//Duplicates to account for the other bolt types
with (HeavyBolt) {
	if(instance_exists(enemy))
	{
		with (enemy) if (my_health <= 0) 
		{ 
			HeavyBolt.heavyKills += 1;
			//trace(HeavyBolt.heavyKills);
			if(HeavyBolt.heavyKills >= global.killsUntilCool){
				audio_play_sound(global.funnySound, 100, false);
				HeavyBolt.heavyKills = 0;
			}	
		}
	}
}

with (ToxicBolt) {
	if(instance_exists(enemy))
	{
		with (enemy) if (my_health <= 0) 
		{ 
			ToxicBolt.toxicKills += 1;
			//trace(ToxicBolt.toxicKills);
			if(ToxicBolt.toxicKills >= global.killsUntilCool){
				audio_play_sound(global.funnySound, 100, false);
				ToxicBolt.toxicKills = 0;
			}	
		}
	}
}

with (UltraBolt) {
	if(instance_exists(enemy))
	{
		with (enemy) if (my_health <= 0) 
		{ 
			UltraBolt.ultraKills += 1;
			//trace(UltraBolt.ultraKills);
			if(UltraBolt.ultraKills >= global.killsUntilCool){
				audio_play_sound(global.funnySound, 100, false);
				UltraBolt.ultraKills = 0;
			}	
		}
	}
}