package uk.co.zutty.ld28 {
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.graphics.Graphiclist;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Text;

    public class GameWorld extends World {

        [Embed(source="/starfield.png")]
        private static const STARFIELD_IMAGE:Class;
        [Embed(source="/background.png")]
        private static const BACKGROUND_IMAGE:Class;

        private var _player:Player;
        private var _dialogue:Dialogue;

        public function GameWorld() {
            super();

            var starfield:Image = new Image(STARFIELD_IMAGE);
            starfield.scrollX = (300 - FP.screen.width) / (1600 - FP.screen.width);
            addGraphic(starfield);
            var background:Image = new Image(BACKGROUND_IMAGE);
            addGraphic(background);

            _player = new Player()
            _player.x = 64;
            add(_player);

            var npc = new NPC();
            npc.x = 200;
            add(npc);

            _dialogue = new Dialogue();
            add(_dialogue);

            _dialogue.show("DIE!", "Onoes");
        }

        override public function update():void {
            super.update();

            FP.camera.x = FP.clamp(_player.x - (FP.screen.width / 2), 0, 1600 - FP.screen.width);
        }
    }
}
