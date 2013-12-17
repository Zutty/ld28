package uk.co.zutty.ld28 {
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.graphics.Text;
    import net.flashpunk.utils.Input;

    public class TitleWorld extends World {

        [Embed(source="/title.png")]
        private static const TITLE_IMAGE:Class;
        [Embed(source="/press_action.png")]
        private static const PRESS_ACTION_IMAGE:Class;

        private var _pressToPlay:Text;
        private var _pressAction:Spritemap;

        public function TitleWorld() {
            addGraphic(new Image(TITLE_IMAGE));

            _pressToPlay = new Text("Press    to play");
            _pressToPlay.size = 8;
            _pressToPlay.centerOrigin();
            _pressToPlay.x = 98;
            _pressToPlay.y = 60;
            addGraphic(_pressToPlay);

            _pressAction = new Spritemap(PRESS_ACTION_IMAGE, 8, 8);
            _pressAction.add("press", [0,1], 0.04);
            _pressAction.centerOrigin();
            _pressAction.x = 60;
            _pressAction.y = 56;
            _pressAction.play("press");
            addGraphic(_pressAction);
        }

        override public function update():void {
            super.update();

            if(Input.pressed("action")) {
                FP.world = new GameWorld();
            }
        }
    }
}
