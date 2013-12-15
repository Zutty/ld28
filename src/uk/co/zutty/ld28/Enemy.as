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
        }

        public function checkDead():void {
            if(_health <= 0) {
                onDie();
            } else {
                onStillAlive();
            }
        }

        public function die():void {
            active = false;
            collidable = false;
        }

        public function onHit():void {}
        public function onDie():void {}
        public function onStillAlive():void {}
    }
}
