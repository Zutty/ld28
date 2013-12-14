/**
 * Created with IntelliJ IDEA.
 * User: Zutty
 * Date: 14/12/2013
 * Time: 16:17
 * To change this template use File | Settings | File Templates.
 */
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
