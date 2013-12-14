/**
 * Created with IntelliJ IDEA.
 * User: Zutty
 * Date: 14/12/2013
 * Time: 15:58
 * To change this template use File | Settings | File Templates.
 */
package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Graphiclist;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Text;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    public class Dialogue extends Entity {

        [Embed(source="/dialogue_wheel.png")]
        private static const DIALOGUE_WHEEL_IMAGE:Class;

        private var _npcLine:Text;
        private var _playerLine:Text;

        public function Dialogue() {
            var dialogueWheel:Image = new Image(DIALOGUE_WHEEL_IMAGE);
            dialogueWheel.scrollX = 0;
            dialogueWheel.x = 10;
            dialogueWheel.y = 56;
            addGraphic(dialogueWheel);

            _npcLine = new Text("");
            _npcLine.scrollX = 0;
            _npcLine.size = 8;
            _npcLine.x = 118;
            _npcLine.y = 2;
            addGraphic(_npcLine);

            _playerLine = new Text("");
            _playerLine.scrollX = 0;
            _playerLine.size = 8;
            _playerLine.x = 27;
            _playerLine.y = 58;
            _playerLine.color = 0xE0DB4C;
            addGraphic(_playerLine);

            Input.define("action", Key.SPACE, Key.ENTER);
        }

        public function show(prompt:String, response:String):void {
            _npcLine.text = prompt;
            _npcLine.x = 118 - _npcLine.textWidth;
            _playerLine.text = response;
            visible = true;
        }

        public function advance():void {
            visible = false;
        }

        override public function update():void {
            if(Input.pressed("action")) {
                advance();
            }
        }
    }
}
