package uk.co.zutty.ld28.event {
    import uk.co.zutty.ld28.*;
    import net.flashpunk.FP;

    import uk.co.zutty.ld28.event.Event;

    public class DialogueEvent extends Event {

        private var _dialogueTree:DialogueTree;

        public function DialogueEvent(position:int, dialogueTree:DialogueTree, next:Event) {
            super(position, next);
            _dialogueTree = dialogueTree;
        }

        override public function handle(world:GameWorld):void {
            FP.camera.x = position - (FP.screen.width / 2);
            world.dialogue(_dialogueTree);
        }
    }
}
