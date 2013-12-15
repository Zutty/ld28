package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.graphics.Graphiclist;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.graphics.Text;
    import net.flashpunk.tweens.misc.VarTween;
    import net.flashpunk.utils.Input;

    public class DeathHud extends Entity {

        [Embed(source="/press_action.png")]
        private static const PRESS_ACTION_IMAGE:Class;

        private var _red:Image;
        private var _youSuck:Text;
        private var _pressAction:Spritemap;
        private var _playAgain:Text;

        public function DeathHud() {
            _red = Image.createRect(FP.width, FP.height, 0xff0000);
            _red.alpha = 0;
            addGraphic(_red);

            _youSuck = new Text("You suck");
            _youSuck.size = 16;
            _youSuck.centerOrigin();
            _youSuck.x = FP.halfWidth;
            _youSuck.y = FP.halfHeight;
            _youSuck.visible = false;
            addGraphic(_youSuck);

            _pressAction = new Spritemap(PRESS_ACTION_IMAGE, 8, 8);
            _pressAction.add("press", [0,1], 0.04);
            _pressAction.centerOrigin();
            _pressAction.x = 40;
            _pressAction.y = 56;
            _pressAction.play("press");
            _pressAction.visible = false;
            addGraphic(_pressAction);

            _playAgain = new Text("Play again");
            _playAgain.size = 8;
            _playAgain.centerOrigin();
            _playAgain.x = 90;
            _playAgain.y = 60;
            _playAgain.visible = false;
            addGraphic(_playAgain);

            graphic.scrollX = 0;
        }

        public function show():void {
            var fade:VarTween = new VarTween(done);
            addTween(fade);
            fade.tween(_red,  "alpha", 0.6, 20);
            fade.start();
        }

        public function done():void {
            _youSuck.visible = true;
            _pressAction.visible = true;
            _playAgain.visible = true;
        }


        override public function update():void {
            if(_playAgain.visible && Input.pressed("action")) {
                FP.world = new GameWorld();
            }
        }
    }
}
