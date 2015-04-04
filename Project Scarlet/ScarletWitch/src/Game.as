package
{

	/** Paquetes de Witch. */
	

	import flash.media.SoundMixer;
	
	import IU.SoundButton;
	
	import ScreenCommands.EndScreenCommand;
	import ScreenCommands.IScreenCommandReceiver;
	import ScreenCommands.StartScreenCommand;
	
	import events.NavigationEvent;
	
	import screens.BaseScreen;
	import screens.InGame;
	import screens.Welcome;
	
	import starling.display.Sprite;
	import starling.events.Event;

	
	public class Game extends Sprite
	{
		
		/** Screen - Bienvenido Menu Principal. */
		//private var screenWelcome:Welcome;
		
		/** Screen - InGame. */
		//private var screenInGame:InGame;
		
		/** Sound / Mute button. */
		private var soundButton:SoundButton;
		
		private var screen:BaseScreen;
		
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		
		/**
		 * Evento que llama a la funcion de inicializar las pantallas. 
		 * 
		 */
		
		private function onAddedtoStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
			//trace("Starling Init!");
			// Initialize screens.
			initScreens();
		}
		
		/**
		 * Init las pantallas del juego. 
		 * 
		 */
		
		private function initScreens():void {

			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			//--------------------------------------------------------------------------------------------//
			//Se elimininan el patron state se encarga de las instanciacion de los objetos de pantalla
			//--------------------------------------------------------------------------------------------//
			// InGame screen.
			/*screenInGame = new InGame();
			screenInGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onInGameNavigation);
			this.addChild(screenInGame);*/
			
			// Pantalla de Bienvenida/Welcome.
			/*screenWelcome = new Welcome(this);
			this.addChild(screenWelcome);*/
			//---------------------------------------------------------------------------------------------//
			screen = new Welcome(this);
			this.addChild(screen);
			

			// Crea y agrege el boton de sonido
			/*soundButton = new SoundButton();
			soundButton.x = int(soundButton.width * 0.5);
			soundButton.y = int(soundButton.height * 0.5);
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)*/
				
				
			
			// Init Welcome por default. 
			//screenWelcome.initialize();
			screen.initialize(); 
		}
		
		/**
		 * Navegar a pantallas diferentes, Welcome y About. 
		 * @param event
		 * 
		 */
		private function onInGameNavigation(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				/*case "mainMenu":
					screenWelcome.initialize();
					break;
				case "about":
					screenWelcome.initialize();
					screenWelcome.showAbout();
					break;*/
				case "mainMenu":
					screen.initialize();
					break;
				case "about":
					screen.initialize();
					screen.showAbout();
					break;
			}
		}
		
		
		/**
		 * On click of the sound/mute button. 
		 * @param event
		 * 
		 */
		
		/*private function onSoundButtonClick(event:Event = null):void
		{
			if (Sounds.muted)
			{
				Sounds.muted = false;
				
				/*if (screenWelcome.visible) Sounds.sndBgMain.play(0, 999);
				else if (screenInGame.visible) Sounds.sndBgGame.play(0, 999);*/
				/*if (screen.visible) Sounds.sndBgMain.play(0, 999);
				else if (screen.visible) Sounds.sndBgGame.play(0, 999);
				
				soundButton.showUnmuteState();
			}
			else
			{
				Sounds.muted = true;
				SoundMixer.stopAll();
				
				soundButton.showMuteState();
			}
		}*/
		
		
		/**
		 * Para cambiar pantalla a modo juego. 
		 * @param event
		 * 
		 */
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				/*case "play":
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;*/
				case "play":
					screen.disposeTemporarily();
					screen.initialize();
					break;
			}
		}
		
		public function setScreenState(newScreen:BaseScreen):void
		{
			screen.disposeTemporarily();
			screen = newScreen;
			this.addChild(screen);
			screen.initialize();
		    

		}
		
	} //Fin Game
	
} //Fin pack