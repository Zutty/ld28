package uk.co.zutty.ld28.event {
    import uk.co.zutty.ld28.GameWorld;

    public class EndCombatEvent extends Event {
        public function EndCombatEvent(position:int, next:Event) {
            super(position, next);
        }

        override public function handle(world:GameWorld):void {
            world.player.canShoot = false;
            world.combatHud.visible = false;
        }
    }
}
