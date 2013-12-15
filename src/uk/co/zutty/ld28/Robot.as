package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;

    public class Robot extends Enemy {

        [Embed(source="/robot.png")]
        private static const ROBOT_IMAGE:Class;

        private static const ATTACK_TIME:uint = 20;

        private var _spritemap:Spritemap;
        private var _activated:Boolean = false;
        private var _timer:uint = 0;

        public function Robot() {
            super(2);

            _spritemap = new Spritemap(ROBOT_IMAGE, 16, 32);
            _spritemap.add("stand", [0]);
            _spritemap.add("walk", [1,2,3,4], 0.1, true);
            _spritemap.add("hit", [5]);
            _spritemap.add("idle", [0,6,7,6,0], 0.1, false);
            _spritemap.add("attack", [8,9], 0.1, true);
            _spritemap.play("stand");
            _spritemap.originX = 8;
            _spritemap.originY = 32;
            graphic = _spritemap;

            y = 66;
            setHitbox(7, 28, 2, 28);
        }

        public function activate():void {
            _activated = true;
            _spritemap.play("walk");
        }

        override public function onHit():void {
            _spritemap.play("hit");
        }

        override public function update():void {
            _timer++;

            if(_activated) {
                moveBy(-0.2, 0, "player");
            } else if(Math.random() < 0.005) {
                _spritemap.callback = function ():void {
                    _spritemap.play("stand");
                }
                _spritemap.play("idle");
            }

            var player:Player = collide("player", x - 1,  y) as Player;
            if(player) {
                _spritemap.play("attack");
                if(_timer >= ATTACK_TIME) {
                    _timer = 0;
                    player.hit();
                }
            }
        }
    }
}
