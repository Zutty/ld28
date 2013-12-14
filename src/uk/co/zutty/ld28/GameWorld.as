package uk.co.zutty.ld28 {
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.graphics.Image;

    public class GameWorld extends World {

        [Embed(source="/starfield.png")]
        private static const STARFIELD_IMAGE:Class;
        [Embed(source="/background.png")]
        private static const BACKGROUND_IMAGE:Class;

        public static const STATE_WANDER:uint = 1;
        public static const STATE_DIALOGUE:uint = 2;

        private var _player:Player;
        private var _dialogue:Dialogue;

        private var shownEvent:Boolean = false;

        private var _state:uint = STATE_WANDER;

        public function GameWorld() {
            var starfield:Image = new Image(STARFIELD_IMAGE);
            starfield.scrollX = (300 - FP.screen.width) / (1600 - FP.screen.width);
            addGraphic(starfield);
            var background:Image = new Image(BACKGROUND_IMAGE);
            addGraphic(background);

            _player = new Player()
            _player.x = 64;
            add(_player);

            var npc:NPC = new NPC();
            npc.x = 200;
            add(npc);

            _dialogue = new Dialogue();
            add(_dialogue);
        }

        override public function update():void {
            super.update();

            if(_state == STATE_WANDER) {
                FP.camera.x = FP.clamp(_player.x - (FP.screen.width / 2), 0, 1600 - FP.screen.width);
            } else if(_state == STATE_DIALOGUE) {
                FP.camera.x = 180 - 64;
            }

            if(!shownEvent && _player.x >= 180) {
                shownEvent = true;
                _state = STATE_DIALOGUE;
                _player.canMove = false;
                _dialogue.show(new DialogueTree(["You killed my brother!", "I challenge you to a", "duel across time & space"], "Ok fine", new DialogueTree(["Oh, seriously?"], "Are you scared?", null)), wander);
            }
        }

        public function wander():void {
            _state = STATE_WANDER;
            _player.canMove = true;
        }
    }
}
