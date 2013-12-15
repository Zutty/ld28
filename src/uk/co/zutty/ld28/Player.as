package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    public class Player extends Entity {

        private static const SPEED:Number = 1.5;

        [Embed(source="/char.png")]
        private static const PLAYER_IMAGE:Class;

        private var _spritemap:Spritemap;
        private var _canMove:Boolean = true;
        private var _canShoot:Boolean = true;

        public function Player() {
            _spritemap = new Spritemap(PLAYER_IMAGE, 16, 32);
            _spritemap.add("stand", [0]);
            _spritemap.add("walk", [0,1], 0.1);
            _spritemap.add("stand_gun", [2]);
            _spritemap.add("walk_gun", [2,3], 0.1);
            _spritemap.add("shoot", [4], 0.1, false);
            _spritemap.centerOrigin();
            _spritemap.play("stand_gun");
            graphic = _spritemap;

            y = 50;

            Input.define("move", Key.D, Key.RIGHT);
            Input.define("action", Key.ENTER, Key.SPACE);
        }

        public function set canMove(value:Boolean):void {
            _canMove = value;
        }

        public function set canShoot(value:Boolean):void {
            _canShoot = value;
        }

        override public function update():void {
            if(_canMove && Input.check("move")) {
                x += SPEED;
                _spritemap.play("walk_gun");
            }
            if(_canMove && Input.released("move")) {
                _spritemap.play("stand_gun");
            }

            if(_canShoot && Input.check("action")) {
                _spritemap.callback = function ():void {
                    _spritemap.play("stand_gun");
                };
                _spritemap.play("shoot");
            }
        }
    }
}
