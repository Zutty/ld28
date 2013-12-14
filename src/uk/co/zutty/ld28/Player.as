package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    public class Player extends Entity {

        private static const SPEED:Number = 1.5;

        [Embed(source="/char.png")]
        private static const PLAYER_IMAGE:Class;

        private var image:Image;
        public var canMove:Boolean = true;

        public function Player() {
            image = new Image(PLAYER_IMAGE);
            image.centerOrigin();
            graphic = image;

            y = 50;

            Input.define("up", Key.W, Key.UP);
            Input.define("down", Key.S, Key.DOWN);
            Input.define("left", Key.A, Key.LEFT);
            Input.define("right", Key.D, Key.RIGHT);
        }

        override public function update():void {
            if(canMove && Input.check("left")) {
                x -= SPEED;
            } else if(canMove && Input.check("right")) {
                x += SPEED;
            }
        }
    }
}
