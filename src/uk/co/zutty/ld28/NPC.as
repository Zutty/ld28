package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class NPC extends Entity {

        [Embed(source="/npc.png")]
        private static const NPC_IMAGE:Class;

        private var _image:Image;

        public function NPC() {
            _image = new Image(NPC_IMAGE);
            _image.centerOrigin();
            graphic = _image;

            y = 50;
        }
    }
}
