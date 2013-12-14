package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Text;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    public class DialogueEntity extends Entity {

        [Embed(source="/dialogue_wheel.png")]
        private static const DIALOGUE_WHEEL_IMAGE:Class;

        private static const TIMEOUT:uint = 100;

        private var _promptText:Text;
        private var _dialogueWheel:Image;
        private var _responseText:Text;

        private var _timer:uint;
        private var _tree:DialogueTree;
        private var _callback:Function;

        public function DialogueEntity() {
            _promptText = new Text("");
            _promptText.scrollX = 0;
            _promptText.size = 8;
            _promptText.x = 118;
            _promptText.y = 2;
            _promptText.visible = false;
            addGraphic(_promptText);

            _dialogueWheel = new Image(DIALOGUE_WHEEL_IMAGE);
            _dialogueWheel.scrollX = 0;
            _dialogueWheel.x = 10;
            _dialogueWheel.y = 56;
            _dialogueWheel.visible = false;
            addGraphic(_dialogueWheel);

            _responseText = new Text("");
            _responseText.scrollX = 0;
            _responseText.size = 8;
            _responseText.x = 27;
            _responseText.y = 58;
            _responseText.color = 0xE0DB4C;
            _responseText.visible = false;
            addGraphic(_responseText);

            Input.define("action", Key.SPACE, Key.ENTER);
        }

        public function show(tree:DialogueTree, callback:Function):void {
            _tree = tree;
            _callback = callback;
            _timer = 0;
            advance();
            visible = true;
        }

        public function set prompt(value:String):void {
            if(value == null) {
                _promptText.visible = false;
            } else {
                _promptText.text = value;
                _promptText.x = 118 - _promptText.textWidth;
                _promptText.visible = true;
            }
        }

        public function set response(value:String):void {
            if(value == null) {
                _responseText.visible = false;
                _dialogueWheel.visible = false;
            } else {
                _responseText.text = value;
                _responseText.visible = true;
                _dialogueWheel.visible = true;
            }
        }

        public function advance():void {
            if(_tree == null) {
                return;
            }

            if(_tree.awaitingResponse) {
                if(!_responseText.visible) {
                    response = _tree.response;
                } else {
                    response = null;
                    prompt = null;
                    _tree = _tree.next;
                    if(_tree == null) {
                        _callback();
                    }
                    advance();
                }
            } else {
                prompt = _tree.nextPrompt;
            }
        }

        override public function update():void {
            ++_timer;

            if(_tree != null && (!_responseText.visible && _timer > TIMEOUT || Input.pressed("action"))) {
                _timer = 0;
                advance();
            }
        }
    }
}
