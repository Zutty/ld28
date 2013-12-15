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
        private var _dialogue:DialogueEntity;
        private var _gunHud:GunHud;

        private var _state:uint = STATE_WANDER;

        private var _nextEvent:Event;

        public function GameWorld() {
            var starfield:Image = new Image(STARFIELD_IMAGE);
            starfield.scrollX = (300 - FP.screen.width) / (1600 - FP.screen.width);
            addGraphic(starfield);
            var background:Image = new Image(BACKGROUND_IMAGE);
            addGraphic(background);

            _player = new Player()
            _player.x = 64;
            _player.ammo = 9;
            add(_player);

            var npc:NPC = new NPC();
            npc.x = 200;
            add(npc);

            _gunHud = new GunHud();
            add(_gunHud);

            _dialogue = new DialogueEntity();
            add(_dialogue);

            _nextEvent = new DialogueEvent(180, new DialogueTree(["You killed my brother!", "I challenge you to a", "duel across time & space"], "Ok fine", new DialogueTree(["Oh, seriously?"], "Are you scared?", null)), null);
        }

        override public function update():void {
            super.update();

            _gunHud.ammo = _player.ammo;

            if(_state == STATE_WANDER) {
                FP.camera.x = FP.clamp(_player.x - (FP.screen.width / 2), 0, 1600 - FP.screen.width);
            }

            if(_nextEvent != null && _player.x >= _nextEvent.position) {
                _nextEvent.handle(this);
                _nextEvent = _nextEvent.next;
            }
        }

        public function dialogue(dialogueTree:DialogueTree):void {
            _state = STATE_DIALOGUE;
            _player.canMove = false;
            _dialogue.show(dialogueTree, wander);
        }

        public function wander():void {
            _state = STATE_WANDER;
            _player.canMove = true;
        }
    }
}
