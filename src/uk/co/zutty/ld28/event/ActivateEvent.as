package uk.co.zutty.ld28.event {
    import uk.co.zutty.ld28.Enemy;
    import uk.co.zutty.ld28.GameWorld;

    public class ActivateEvent extends Event {

        private var _enemy:Enemy;

        public function ActivateEvent(position:int, enemy:Enemy, next:Event) {
            super(position, next);
            _enemy = enemy;
        }

        override public function handle(world:GameWorld):void {
            _enemy.activate();
        }
    }
}
