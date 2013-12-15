package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Spritemap;

    public class Robot extends Entity {

        [Embed(source="/robot.png")]
        private static const ROBOT_IMAGE:Class;

        private var _spritemap:Spritemap;
        private var _activated:Boolean = false;

        public function Robot() {
            _spritemap = new Spritemap(ROBOT_IMAGE, 16, 32);
            _spritemap.add("stand", [0]);
            _spritemap.add("walk", [1,2,3,4], 0.1, true);
            _spritemap.add("hit", [5]);
            _spritemap.add("idle", [0,6,7,6,0], 0.1, false);
            _spritemap.centerOrigin();
            graphic = _spritemap;
            _spritemap.play("stand");
            y = 50;
        }

        public function activate():void {
            _activated = true;
            _spritemap.play("walk");
        }

        override public function update():void {
            if(_activated) {
                x -= 0.2;
            } else if(Math.random() < 0.005) {
                _spritemap.callback = function ():void {
                    _spritemap.play("stand");
                }
                _spritemap.play("idle");
            }
        }
    }
}
