package uk.co.zutty.ld28 {
    public class DialogueTree {

        private var _prompts:Array;
        private var _response:String;
        private var _next:DialogueTree;
        private var _promptIdx:uint = 0;

        public function DialogueTree(prompts:Array, response:String, next:DialogueTree) {
            _prompts = prompts;
            _response = response;
            _next = next;
        }

        public function reset():void {
            _promptIdx = 0;
        }

        public function get nextPrompt():String {
            return (_promptIdx < _prompts.length) ? _prompts[_promptIdx++] : null;
        }

        public function get awaitingResponse():Boolean {
            return _promptIdx >= _prompts.length;
        }

        public function get response():String {
            return _response;
        }

        public function get next():DialogueTree {
            return _next;
        }
    }
}
