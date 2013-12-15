package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.graphics.Image;

    public class PlayerBullet extends Entity {

        public static const RANGE:Number = 60;

        [Embed(source="/gun_ricochet.png")]
        private static const RICOCHET_IMAGE:Class;

        private var _removeNextUpdate:Boolean = false;

        public function PlayerBullet() {
            var img = new Image(RICOCHET_IMAGE);
            img.centerOrigin();
            graphic = img;
        }

        override public function added():void {
            _removeNextUpdate = false;
            visible = false;
        }

        override public function update():void {
            if(_removeNextUpdate) {
                FP.world.recycle(this);
                return;
            }

            moveBy(RANGE, 0, "enemy", true);

            var enemy:Enemy = collide("enemy", x + 1,  y) as Enemy;
            if(enemy) {
                visible = true;
                enemy.hit();
            }

            _removeNextUpdate = true;
        }
    }
}
