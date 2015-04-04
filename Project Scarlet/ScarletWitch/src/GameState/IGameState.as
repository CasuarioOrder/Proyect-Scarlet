package GameState
{
	import screens.InGame;
	
	/**
	 * Interfaz para el manejo de los estados del juego
	 */
	public interface IGameState
	{
		/** Metodos **/ 
		
		function handleState(pGame:Game):void;
	}
}