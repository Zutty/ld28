package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    public class Player extends Entity {

        private static const SPEED:Number = 1.5;
        public static const MAX_HEALTH:int = 5;

        [Embed(source="/char.png")]
        private static const PLAYER_IMAGE:Class;

        private var _spritemap:Spritemap;
        private var _canMove:Boolean = true;
        private var _canShoot:Boolean = false;
        private var _moving:Boolean = false;
        private var _ammo:int = 0;
        private var _health:int = MAX_HEALTH;

        public function Player() {
            _spritemap = new Spritemap(PLAYER_IMAGE, 16, 32);
            _spritemap.add("stand", [0]);
            _spritemap.add("walk", [0,1], 0.1);
            _spritemap.add("stand_gun", [2]);
            _spritemap.add("walk_gun", [2,3], 0.1);
            _spritemap.add("shoot", [4], 0.1, false);
            _spritemap.add("hit_gun", [5], 0.1, false);
            _spritemap.originX = 8;
            _spritemap.originY = 32;
            _spritemap.play("stand");
            graphic = _spritemap;

            y = 66;
            setHitbox(9, 32, 6, 32);
            type = "player";

            Input.define("move", Key.D, Key.RIGHT);
            Input.define("action", Key.ENTER, Key.SPACE);
        }

        public function get ammo():int {
            return _ammo;
        }

        public function set ammo(value:int):void {
            _ammo = value;
        }

        public function get health():int {
            return _health;
        }

        public function set canMove(value:Boolean):void {
            _canMove = value;
            _moving = false;
            resetAnim();
        }

        public function set canShoot(value:Boolean):void {
            _canShoot = value;
            resetAnim();
        }

        public function shoot():void {
            if(_ammo <= 0) {
                return;
            }

            _spritemap.callback = resetAnim;
            _spritemap.play("shoot");
            --_ammo;
        }

        public function resetAnim():void {
            _spritemap.play(_canShoot ? (_moving ? "walk_gun" : "stand_gun") : (_moving ? "walk" : "stand"));
        }

        public function hit():void {
            --_health;
            _spritemap.callback = resetAnim;
            _spritemap.play("hit_gun", true);
        }

        override public function update():void {
            if(_canMove && Input.check("move")) {
                moveBy(SPEED, 0, "enemy");
                _moving = true;
                _spritemap.play(_canShoot ? "walk_gun" : "walk");
            }
            if(_canMove && Input.released("move")) {
                _moving = false;
                _spritemap.play(_canShoot ? "stand_gun" : "stand");
            }

            if(_canShoot && Input.pressed("action")) {
                shoot();
            }
        }
    }
}
