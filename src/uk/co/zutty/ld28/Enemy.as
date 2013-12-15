package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.FP;

    public class Enemy extends Entity {

        private var _health:int = 0;

        public function Enemy(maxHealth:int) {
            _health = maxHealth;
            type = "enemy";
        }

        public function hit():void {
            --_health;
            onHit();
            if(_health <= 0) {
                FP.world.recycle(this);
            }
        }

        public function onHit():void {}
    }
}
