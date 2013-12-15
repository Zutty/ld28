package uk.co.zutty.ld28.event {
    import uk.co.zutty.ld28.*;
    public class Event {

        private var _position:int;
        private var _next:Event;

        public function Event(position:int, next:Event) {
            _position = position;
            _next = next;
        }

        public function get position():int {
            return _position;
        }

        public function get next():Event {
            return _next;
        }

        public function handle(world:GameWorld):void {}
    }
}