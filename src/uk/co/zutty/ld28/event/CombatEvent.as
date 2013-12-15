package uk.co.zutty.ld28.event {
    import uk.co.zutty.ld28.GameWorld;

    public class CombatEvent extends Event {

        public function CombatEvent(position:int, next:Event) {
            super(position, next);
        }

        override public function handle(world:GameWorld):void {
            world.player.canShoot = true;
            world.combatHud.visible = true;
        }
    }
}
